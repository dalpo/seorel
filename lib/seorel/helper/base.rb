# require 'action_view/helpers/tag_helper/capture_helper'
# require 'action_view/helpers/tag_helper'

# encoding: utf-8
module Seorel
  module Helper
    class Base
      # include ActionView::Helpers::TagHelper

      attr_reader :request, :params

      delegate :title, :description, :image, to: :params

      def initialize(request, params)
        @request = request
        @params = params
      end

      def helpers
        ActionController::Base.helpers
      end

      alias_method :h, :helpers

      # def h.content_tag(*args)
      #   ActionView::Helpers::TagHelper.h.content_tag(*args)
      # end

      def locale
        if I18n.locale.to_s.size == 2
          "#{I18n.locale}_#{I18n.locale.to_s.upcase}"
        else
          I18n.locale
        end
      end

      def image_url
        if /^(http|https|\/\/)/.match(image)
          image
        else
          "#{request.protocol}#{request.host_with_port}#{image}"
        end
      end

      def all
        []
      end

      def render
        all.join.html_safe
      end
    end
  end
end
