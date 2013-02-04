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

    config_accessor :default_title
    config_accessor :default_description
    config_accessor :default_image
    config_accessor :prepend_title
    config_accessor :append_title

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    # define param_name writer (copied from AS::Configurable)
    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  # this is ugly. why can't we pass the default value to config_accessor...?
  configure do |config|
    config.default_title = nil
    config.default_description = nil
    config.default_image = nil
    config.prepend_title = nil
    config.append_title  = nil
  end
end
