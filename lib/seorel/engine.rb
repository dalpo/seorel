# frozen_string_literal: true

require 'rails'
require 'rails/engine'

module Seorel
  class Engine < ::Rails::Engine
    isolate_namespace Seorel

    initializer 'Seorel Setup' do |app|
      app.config.to_prepare do
        ActionController::Base.send :extend,  ::Seorel::Controller::ClassMethods
        ActionController::Base.send :include, ::Seorel::Controller::InstanceMethods
        ActionController::Base.send :helper_method, :seorel_params
        ActionView::Base.send :include, ::Seorel::Helper
      end
    end
  end
end
