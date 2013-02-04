require 'active_support/configurable'

module Seorel
  module Controller
    class Params
      include ActiveSupport::Configurable

      config_accessor :title
      config_accessor :description
      config_accessor :image

      def full_title
        [Seorel.config.prepend_title, self.title, Seorel.config.append_title].compact.join
      end

      def title
        self.config.title || Seorel.config.default_title
      end

      def description
        self.config.description || Seorel.config.default_description
      end

      def image
        self.config.image || Seorel.config.default_image
      end

    end
  end
end
