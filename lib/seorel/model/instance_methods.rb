# encoding: utf-8
module Seorel
  module Model
    module InstanceMethods

      def seorel?
        self.try(:seorel).present?
      end

      def set_seorel_default_values
        self.build_seorel unless self.seorel?

        self.seorel.title       = self.seorel_title_value       unless self.seo_title?
        self.seorel.description = self.seorel_description_value unless self.seo_description?
      end

      def seorel_title_value
        raw_title = self.class.seorel_title_field && self.send(self.class.seorel_title_field)
        ::ActionController::Base.helpers.strip_tags(raw_title.to_s).first(255)
      end

      def seorel_description_value
        raw_description = self.class.seorel_description_field && self.send(self.class.seorel_description_field)
        ::ActionController::Base.helpers.strip_tags(raw_description.to_s).first(255)
      end

      def seorel_default_value?
        self.class.seorel_base_field.present?
      end

    end
  end
end
