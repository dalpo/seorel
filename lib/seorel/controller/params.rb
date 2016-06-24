# frozen_string_literal: true
# encoding: utf-8
require 'active_support/configurable'

module Seorel
  module Controller
    class Params
      include ActiveSupport::Configurable

      config_accessor :title
      config_accessor :description
      config_accessor :image

      def initialize(controller = nil)
        @controller = controller
      end

      def title
        [
          self.lookup_prepend_title,
          self.base_title,
          self.lookup_append_title
        ].compact.join.html_safe
      end

      def description
        [
          self.lookup_prepend_description,
          self.base_description,
          self.lookup_append_description
        ].compact.join.html_safe
      end

      def image
        config.image || default_options.default_image
      end

      def open_graph_extras
        default_options.default_og_metas
      end

      def twitter_extras
        default_options.default_twitter_metas
      end

      protected

        attr_reader :controller

        def base_title
          (config.title || self.lookup_title).html_safe
        end

        def base_description
          (config.description || self.lookup_description).html_safe
        end

        def default_options
          ::Seorel.config
        end

        def lookup_i18n(key, default = nil)
          I18n.t i18n_path(key), default: (default || '')
        end

        def lookup_prepend_title
          lookup_i18n :prepend_title, default_options.default_prepend_title
        end

        def lookup_title
          lookup_i18n :title, default_options.default_title
        end

        def lookup_append_title
          lookup_i18n :append_title, default_options.default_append_title
        end

        def lookup_prepend_description
          lookup_i18n :prepend_description, default_options.default_prepend_description
        end

        def lookup_description
          lookup_i18n :description, default_options.default_description
        end

        def lookup_append_description
          lookup_i18n :append_description, default_options.default_append_description
        end

        def controller_name
          if controller
            controller.class.name.underscore.gsub(/_controller$/, '')
          else
            'undefined'
          end
        end

        def action_name
          controller ? controller.action_name : 'undefined'
        end

        def i18n_path(key)
          ['seorel', self.controller_name, self.action_name, key].join('.')
        end
    end
  end
end
