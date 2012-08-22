require "seorel/engine"
require "seorel/base"

module Seorel

  def self.extended(model_class)
    return if model_class.respond_to? :seorel

    model_class.instance_eval do
      extend Base
      # @seorel_config = Class.new(Configuration).new(self)
      # Seorel.defaults.call @seorel_config
    end
  end

end
