require 'ostruct'
require 'json'
require_relative 'types'

module AppCommonRuby
  class Config < AppConfig
    # Check if clowder config's ENV var is defined
    # If true, svc is deployed by Clowder
    def self.clowder_enabled?
      !ENV['ACG_CONFIG'].nil? && ENV['ACG_CONFIG'] != ""
    end

    def self.load(acg_config = ENV['ACG_CONFIG'] || 'test.json')
      unless File.exist?(acg_config)
        raise "ERROR: #{acg_config} does not exist"
      end

      new(acg_config)
    end

    def initialize(acg_config)
      super(JSON.parse(File.read(acg_config)))
      kafka_servers
      kafka_topics
      object_buckets
      dependency_endpoints
      private_dependency_endpoints
    end

    # List of Kafka Broker URLs.
    def kafka_servers
      @kafka_servers ||= [].tap do |servers|
        kafka.brokers.each do |broker|
          servers << "{#{broker.hostname}}:{#{broker.port}}"
        end
      end
    end

    # Map of KafkaTopics using the requestedName as the key and the topic object as the value.
    def kafka_topics
      @kafka_topics ||= {}.tap do |topics|
        kafka.topics.each do |topic|
          next if topic.requestedName.nil?

          topics[topic.requestedName] = topic
        end
      end
    end

    # List of ObjectBuckets using the requestedName
    def object_buckets
      @object_buckets ||= {}.tap do |buckets|
        objectStore.buckets.each do |bucket|
          next if bucket.requestedName.nil?

          buckets[bucket.requestedName] = bucket
        end
      end
    end

    # Nested map using [appName][deploymentName]
    # for the public services of requested applications.
    def dependency_endpoints
      @dependency_endpoints ||= {}.tap do |endpts|
        endpoints.each do |endpoint|
          next if endpoint.app.nil? || endpoint.name.nil?

          endpts[endpoint.app]                = {} unless endpts.include?(endpoint.app)
          endpts[endpoint.app][endpoint.name] = endpoint
        end
      end
    end

    # nested map using [appName][deploymentName]
    #   for the private services of requested applications.
    def private_dependency_endpoints
      @private_dependency_endpoints ||= {}.tap do |priv_endpts|
        privateEndpoints.each do |endpoint|
          next if endpoint.app.nil? || endpoint.name.nil?

          priv_endpts[endpoint.app]                = {} unless priv_endpts.include?(endpoint.app)
          priv_endpts[endpoint.app][endpoint.name] = endpoint
        end
      end
    end
  end
end
