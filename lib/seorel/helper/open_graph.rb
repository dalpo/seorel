require 'seorel/helper/base'

# encoding: utf-8
module Seorel
  module Helper
    class OpenGraph < Base
      def title_tag
        content_tag :meta, nil, property: 'og:title', content: title
      end

      def description_tag
        content_tag :meta, nil, property: 'og:description', content: description
      end

      def locale_tag
        content_tag(:meta, nil, property: 'og:locale', content: locale)
      end

      def image_tag
        content_tag(:meta, nil, property: 'og:image', content: image) if image
      end

      def url_tag
        content_tag(:meta, nil, property: 'og:url', content: request.url)
      end

      def custom_tags
        params.open_graph_extras.reduce([]) do |memo, (key, value)|
          custum_tag(key, value)
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
        content_tag(:meta, nil, property: "og:#{key}", content: value)
      end
    end
  end
end
