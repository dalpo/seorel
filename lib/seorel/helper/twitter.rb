# frozen_string_literal: true
# encoding: utf-8
require 'seorel/helper/base'

module Seorel
  module Helper
    class Twitter < Base
      def title_tag
        h.tag :meta, nil, name: 'twitter:title', content: title
      end

      def description_tag
        h.tag :meta, nil, name: 'twitter:description', content: description
      end

      def image_tag
        h.tag(:meta, nil, name: 'twitter:image', content: image_url) if image
      end

      def url_tag
        h.tag(:meta, nil, name: 'twitter:url', content: request.url)
      end

      def custom_tags
        params.twitter_extras.reduce([]) do |data, (key, value)|
          data.push custum_tag(key, value)
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
        h.tag(:meta, nil, name: "twitter:#{key}", content: value)
      end
    end
  end
end
