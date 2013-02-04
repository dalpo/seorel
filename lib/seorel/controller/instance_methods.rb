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
        seosel_metatags = values
      end

      def add_seorel_model(model)
        seosel_metatags = {
          title: model.seo_title,
          description: model.seo_description,
          image: (model.seo_image.default.url rescue nil)
        }
      end

      def seosel_metatags
        @seosel_metatags ||= {}
      end

      def seosel_metatags=(values = {})
        @seosel_metatags = seosel_metatags.merge(values)
      end

    end
  end
end
