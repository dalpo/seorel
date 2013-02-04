module Seorel
  module Controller
    module InstanceMethods

      def add_meta(values = {})
        @seosel_metatags ||= {}
        @seosel_metatags.merge(values)
      end

    end
  end
end
