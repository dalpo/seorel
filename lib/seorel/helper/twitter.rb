require 'seorel/helper/base'

# encoding: utf-8
module Seorel
  module Helper
    class Twitter < Base
      def title_tag
        content_tag :meta, nil, name: 'twitter:title', content: title
      end

      def description_tag
        content_tag :meta, nil, name: 'twitter:description', content: description
      end

      def image_tag
        content_tag(:meta, nil, name: 'twitter:image', content: image) if image
      end

      def url_tag
        content_tag(:meta, nil, name: 'twitter:url', content: request.url)
      end

      def custom_tags
        params.twitter_extras.reduce([]) do |memo, (key, value)|
          custum_tag(key, value)
        end
      end

      def all
        ([
          title_tag,
          description_tag,
          image_tag,
          url_tag
        ] + custom_tags).compact
      end

      protected

      def custum_tag(key, value)
        content_tag(:meta, nil, name: "twitter:#{key}", content: value)
      end
    end
  end
end
