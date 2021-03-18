# This file is automatically generated by bin/json_schema_ruby
require 'ostruct'

module ClowderCommonRuby
  class AppConfig < OpenStruct
    attr_accessor :logging
    attr_accessor :kafka
    attr_accessor :database
    attr_accessor :objectStore
    attr_accessor :inMemoryDb
    attr_accessor :featureFlags
    attr_accessor :endpoints
    attr_accessor :privateEndpoints

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

      @logging = LoggingConfig.new(attributes.fetch(:logging, {}))
      @kafka = KafkaConfig.new(attributes.fetch(:kafka, {}))
      @database = DatabaseConfig.new(attributes.fetch(:database, {}))
      @objectStore = ObjectStoreConfig.new(attributes.fetch(:objectStore, {}))
      @inMemoryDb = InMemoryDBConfig.new(attributes.fetch(:inMemoryDb, {}))
      @featureFlags = FeatureFlagsConfig.new(attributes.fetch(:featureFlags, {}))
      @endpoints = []
      attributes.fetch(:endpoints, []).each do |attr|
        @endpoints << DependencyEndpoint.new(attr)
      end
      @privateEndpoints = []
      attributes.fetch(:privateEndpoints, []).each do |attr|
        @privateEndpoints << PrivateDependencyEndpoint.new(attr)
      end
    end

    def valid_keys
      [].tap do |keys|
        keys << :privatePort
        keys << :publicPort
        keys << :webPort
        keys << :metricsPort
        keys << :metricsPath
        keys << :logging
        keys << :kafka
        keys << :database
        keys << :objectStore
        keys << :inMemoryDb
        keys << :featureFlags
        keys << :endpoints
        keys << :privateEndpoints
      end
    end
  end

  class LoggingConfig < OpenStruct
    attr_accessor :cloudwatch

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

      @cloudwatch = CloudWatchConfig.new(attributes.fetch(:cloudwatch, {}))
    end

    def valid_keys
      [].tap do |keys|
        keys << :type
        keys << :cloudwatch
      end
    end
  end

  class CloudWatchConfig < OpenStruct

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

    end

    def valid_keys
      [].tap do |keys|
        keys << :accessKeyId
        keys << :secretAccessKey
        keys << :region
        keys << :logGroup
      end
    end
  end

  class KafkaConfig < OpenStruct
    attr_accessor :brokers
    attr_accessor :topics

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

      @brokers = []
      attributes.fetch(:brokers, []).each do |attr|
        @brokers << BrokerConfig.new(attr)
      end
      @topics = []
      attributes.fetch(:topics, []).each do |attr|
        @topics << TopicConfig.new(attr)
      end
    end

    def valid_keys
      [].tap do |keys|
        keys << :brokers
        keys << :topics
      end
    end
  end

  class BrokerConfig < OpenStruct

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

    end

    def valid_keys
      [].tap do |keys|
        keys << :hostname
        keys << :port
      end
    end
  end

  class TopicConfig < OpenStruct

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

    end

    def valid_keys
      [].tap do |keys|
        keys << :requestedName
        keys << :name
        keys << :consumerGroup
      end
    end
  end

  class DatabaseConfig < OpenStruct

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

    end

    def valid_keys
      [].tap do |keys|
        keys << :name
        keys << :username
        keys << :password
        keys << :hostname
        keys << :port
        keys << :adminUsername
        keys << :adminPassword
        keys << :rdsCa
        keys << :sslMode
      end
    end
  end

  class ObjectStoreBucket < OpenStruct

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

    end

    def valid_keys
      [].tap do |keys|
        keys << :accessKey
        keys << :secretKey
        keys << :region
        keys << :requestedName
        keys << :name
      end
    end
  end

  class ObjectStoreConfig < OpenStruct
    attr_accessor :buckets

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

      @buckets = []
      attributes.fetch(:buckets, []).each do |attr|
        @buckets << ObjectStoreBucket.new(attr)
      end
    end

    def valid_keys
      [].tap do |keys|
        keys << :buckets
        keys << :accessKey
        keys << :secretKey
        keys << :hostname
        keys << :port
        keys << :tls
      end
    end
  end

  class FeatureFlagsConfig < OpenStruct

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

    end

    def valid_keys
      [].tap do |keys|
        keys << :hostname
        keys << :port
      end
    end
  end

  class InMemoryDBConfig < OpenStruct

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

    end

    def valid_keys
      [].tap do |keys|
        keys << :hostname
        keys << :port
        keys << :username
        keys << :password
      end
    end
  end

  class DependencyEndpoint < OpenStruct

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

    end

    def valid_keys
      [].tap do |keys|
        keys << :name
        keys << :hostname
        keys << :port
        keys << :app
      end
    end
  end

  class PrivateDependencyEndpoint < OpenStruct

    def initialize(attributes)
      super
      raise 'The input argument (attributes) must be a hash' if (!attributes || !attributes.is_a?(Hash))

      attributes = attributes.each_with_object({}) do |(k, v), h|
        raise "The input [#{k}] is invalid" unless valid_keys.include?(k.to_sym)
        h[k.to_sym] = v
      end

    end

    def valid_keys
      [].tap do |keys|
        keys << :name
        keys << :hostname
        keys << :port
        keys << :app
      end
    end
  end
end
