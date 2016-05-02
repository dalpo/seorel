require 'seorel/helper/base'

# encoding: utf-8
module Seorel
  module Helper
    class Generic < Base
      def title_tag
        content_tag :title, title
      end

      def description_tag
        content_tag :meta, nil, name: 'description', content: seorel_params.description
      end

      def all
        [
          title_tag,
          description_tag
        ]
      end
    end
  end
end
