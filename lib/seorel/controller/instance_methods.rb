# encoding: utf-8
module Seorel
  module Controller
    module InstanceMethods

      def add_seorel_meta(obj = {})
        if obj.class.name == 'Hash'
          add_seorel_hash obj
        elsif obj.respond_to? :seorel
          add_seorel_model obj
        else
          raise "Seorel `add_seorel_meta` invalid argument"
        end
      end

      def add_seorel_hash(values = {})
        seorel_params.title = values[:title] if values[:title].present?
        seorel_params.description = values[:description] if values[:description].present?
        seorel_params.image = values[:image] if values[:image].present?
        seorel_params
      end

      def add_seorel_model(model)
        seorel_params.title = model.seo_title
        seorel_params.description = model.seo_description
        seorel_params.image = model.seo_image.default.url if model.seo_image?
        seorel_params
      end

      def seorel_params
        @seosel_metatags ||= ::Seorel::Controller::Params.new
      end

      def self.included(klass)
        return if klass.respond_to? :add_metatags
        alias_method :add_metatags, :add_seorel_meta
        protected :add_seorel_meta, :add_seorel_hash, :add_seorel_model, :seorel_params
      end

    end
  end
end
