# frozen_string_literal: true
# encoding: utf-8
require 'seorel/helper/base'

module Seorel
  module Helper
    class Generic < Base
      def title_tag
        h.content_tag :title, title
      end

      def description_tag
        h.tag :meta, nil, name: 'description', content: params.description
      end

      def keywords_tag
        return if params.keywords.blank?
        h.tag :meta, nil, name: 'keywords', content: params.keywords
      end

      def all
        [
          title_tag,
          description_tag,
          keywords_tag
        ].compact
      end
    end
  end
end
