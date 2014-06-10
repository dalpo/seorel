# encoding: utf-8
require 'active_support/configurable'

module Seorel
  module Controller
    class Params
      include ActiveSupport::Configurable

      config_accessor :title
      config_accessor :description
      config_accessor :image

      def initialize(controller)
        @controller = controller
      end

      def full_title
        [default_options.prepend_title, self.title, default_options.append_title].compact.join.html_safe
      end

      def title
        (config.title || I18n.t(i18n_path(:title), default: default_options.default_title)).html_safe
      end

      def description
        (config.description || I18n.t(i18n_path(:description), default: default_options.default_description)).html_safe
      end

      def image
        config.image || default_options.default_image
      end

      def default_options
        ::Seorel.config
      end

    protected

      def controller
        @controller
      end

      def i18n_path(key)
        [
          'seorel',
          controller.class.name.underscore,
          controller.action_name,
          key
        ].join('.')
      end

    end
  end
end
