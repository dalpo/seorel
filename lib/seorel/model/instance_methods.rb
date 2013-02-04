module Seorel
  module Model
    module InstanceMethods

      def seorel?
        self.try(:seorel).present?
      end

      def set_seorel_default_values
        self.seorel.title = self.seorel_base_value if self.seorel.title.blank?
        self.seorel.description = self.seorel_base_value if self.seorel.description.blank?
      end

      def seorel_base_value
        self.send self.class.seorel_base_field
      end

      def seorel_default_value?
        self.class.seorel_base_field.present?
      end

    end
  end
end
