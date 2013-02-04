module Seorel
  module Controller
    module ClassMethods

      def add_seorel_meta(values = {})
        class_name = self.name

        before_filter options do |controller|
          controller.send :add_meta, values
        end
      end

    end
  end
end
