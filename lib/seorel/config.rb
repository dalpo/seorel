# encoding: utf-8
require 'active_support/configurable'

module Seorel
  # Configures global settings for Seorel
  #   Seorel.configure do |config|
  #     config.default_default_title = 10
  #   end
  def self.configure(&block)
    yield @config ||= Seorel::Configuration.new
  end

  # Global settings for Seorel
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable

    config_accessor :default_prepend_title
    config_accessor :default_title
    config_accessor :default_append_title

    config_accessor :default_prepend_description
    config_accessor :default_description
    config_accessor :default_append_description

    config_accessor :default_image

    config_accessor :store_seorel_if

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    # define param_name writer (copied from AS::Configurable)
    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  configure do |config|
    config.default_prepend_title = nil
    config.default_title = nil
    config.default_append_title  = nil

    config.default_prepend_description = nil
    config.default_description = nil
    config.default_append_description  = nil

    config.default_image = nil

    config.store_seorel_if = :empty
  end
end
