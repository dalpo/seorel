module Seorel
  class Engine < ::Rails::Engine

    isolate_namespace Seorel

    initializer 'Seorel::Controller Methods' do |app|
      app.config.to_prepare do
        ActionController::Base.send :extend,  ::Seorel::Controller::ClassMethods
        ActionController::Base.send :include, ::Seorel::Controller::InstanceMethods
      end
    end

  end
end
