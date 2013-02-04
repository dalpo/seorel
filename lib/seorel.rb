require "seorel/engine"
require "seorel/model/base"
require "seorel/model/instance_methods"
require "seorel/model/class_methods"

module Seorel

  def self.extended(model_class)
    return if model_class.respond_to? :seorel

    model_class.instance_eval do
      extend Model::Base
    end
  end

end
