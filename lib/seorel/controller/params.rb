require 'active_support/configurable'

module Seorel
  module Controller
    class Params
      include ActiveSupport::Configurable

      config_accessor :title
      config_accessor :description
      config_accessor :image

      def full_title
        [default_options.prepend_title, self.title, default_options.append_title].compact.join
      end

      def title
        config.title || default_options.default_title
      end

      def description
        config.description || default_options.default_description
      end

      def image
        config.image || default_options.default_image
      end

      def default_options
        ::Seorel.config
      end

    end
  end
end
