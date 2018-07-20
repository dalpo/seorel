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

      def eval_page
        page_ = controller.params[:page]
        page_string_ = default_options.pagination_format.gsub('%page%', page_) rescue ''
        ( default_options.enable_pagination && page_.present? ) ? page_string_ : ''
      end

      def title
        [
          lookup_prepend_title,
          base_title,
          eval_page,
          lookup_append_title
        ].compact.join.html_safe
      end

      def description
        [
          lookup_prepend_description,
          base_description,
          eval_page,
          lookup_append_description
        ].compact.join.html_safe
      end

      def keywords
        default_options.default_keywords
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
        (config.title || lookup_title).html_safe
      end

      def base_description
        (config.description || lookup_description).html_safe
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
        ['seorel', controller_name, action_name, key].join('.')
      end
    end
  end
end
