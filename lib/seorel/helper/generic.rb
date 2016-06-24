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
        h.content_tag :meta, nil, name: 'description', content: params.description
      end

      def all
        [
          title_tag,
          description_tag
        ].compact
      end
    end
  end
end
