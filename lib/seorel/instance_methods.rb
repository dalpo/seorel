module Seorel
  module Base
    module InstanceMethods

      def seorel?
        self.seorel.present?
      end

      def set_empty_fields
        self.seorel.title ||= self.send @seorel_base_field
        self.seorel.description ||= self.send @seorel_base_field
      end

    end
  end
end