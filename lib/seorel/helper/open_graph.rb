# frozen_string_literal: true
# encoding: utf-8
require 'seorel/helper/base'

module Seorel
  module Helper
    class OpenGraph < Base
      def title_tag
        h.tag :meta, property: 'og:title', content: title
      end

      def description_tag
        h.tag :meta, property: 'og:description', content: description
      end

      def locale_tag
        h.tag(:meta, property: 'og:locale', content: locale)
      end

      def image_tag
        h.tag(:meta, property: 'og:image', content: image_url) if image
      end

      def url_tag
        h.tag(:meta, property: 'og:url', content: request.url)
      end

      def custom_tags
        params.open_graph_extras.reduce([]) do |data, (key, value)|
          data.push custum_tag(key, value)
        end
      end

      def all
        ([
          title_tag,
          description_tag,
          locale_tag,
          image_tag,
          url_tag
        ] + custom_tags).compact
      end

      protected

      def custum_tag(key, value)
        h.tag(:meta, property: "og:#{key}", content: value)
      end
    end
  end
end
