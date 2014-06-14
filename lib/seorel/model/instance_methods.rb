# encoding: utf-8
module Seorel
  module Model
    module InstanceMethods
      def seorel?
        self.try(:seorel).present?
      end

      def seorel_changed_mode?
        ::Seorel.config.store_seorel_if.eql?(:changed)
      end

      def should_update_seo_title?
        self.seorel_changed_mode? || !self.seo_title?
      end

      def should_update_seo_description?
        self.seorel_changed_mode? || !self.seo_description?
      end

      def set_seorel
        self.build_seorel unless self.seorel?

        self.seorel.title       = self.seorel_title_value       if self.should_update_seo_title?
        self.seorel.description = self.seorel_description_value if self.should_update_seo_description?
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
