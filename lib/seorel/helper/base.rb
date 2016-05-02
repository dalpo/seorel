# encoding: utf-8
module Seorel
  module Helper
    class Base
      attr_reader :request, :params

      delegate :title, :description, :image, to: :params

      def initialize(request, params)
        @request = request
        @params = params
      end

      def content_tag(*args)
        ActionView::Helpers::TagHelper.content_tag(*args)
      end

      def locale
        if I18n.locale.to_s.size == 2
          "#{I18n.locale}_#{I18n.locale.to_s.upcase}"
        else
          I18n.locale
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
