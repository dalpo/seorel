# frozen_string_literal: true
# encoding: utf-8

module Seorel
  module Model
    module InstanceMethods
      def seorel?
        try(:seorel).present?
      end

      def seorel_changed_mode?
        ::Seorel.config.store_seorel_if.eql?(:changed)
      end

      def should_update_seo_title?
        seorel_changed_mode? || !seo_title?
      end

      def should_update_seo_description?
        seorel_changed_mode? || !seo_description?
      end

      def should_update_seo_image?
        seorel_changed_mode? || !seo_image?
      end

      def set_seorel
        build_seorel unless seorel?

        seorel.title       = seorel_title_value       if should_update_seo_title?
        seorel.description = seorel_description_value if should_update_seo_description?
        seorel.image       = seorel_image_value       if should_update_seo_image?
      end

      def seorel_title_value
        raw_title = self.class.seorel_title_field && send(self.class.seorel_title_field)
        ::ActionController::Base.helpers.strip_tags(raw_title.to_s).first(255)
      end

      def seorel_description_value
        raw_description = self.class.seorel_description_field && send(self.class.seorel_description_field)
        ::ActionController::Base.helpers.strip_tags(raw_description.to_s).first(255)
      end

      def seorel_image_value
        raw_image = self.class.seorel_image_field && send(self.class.seorel_image_field)
        ::ActionController::Base.helpers.strip_tags(raw_image.to_s)
      end

      def seorel_default_value?
        self.class.seorel_base_field.present?
      end
    end
  end
end
