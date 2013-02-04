module Seorelify

  def self.extended(model_class)
    return if model_class.respond_to? :seorel

    model_class.instance_eval do
      extend ::Seorel::Model::Base
    end
  end

  def self.included(model_class)
    return if model_class.respond_to? :seorel

    model_class.instance_eval do
      extend ::Seorel::Model::Base
    end
  end

end
