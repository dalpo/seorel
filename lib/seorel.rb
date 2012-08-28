require "seorel/engine"
require "seorel/base"
require "seorel/instance_methods"
require "seorel/class_methods"
# require "seorel/rails_admin"

module Seorel

  def self.extended(mod)
    return if model_class.respond_to? :seorel

    model_class.instance_eval do
      extend Base
    end
  end

end
