# frozen_string_literal: true
# encoding: utf-8
module Seorel
  module Model
    module Base
      def seorelify(*args)
        extend  ClassMethods
        include InstanceMethods

        cattr_accessor :seorel_title_field, :seorel_description_field, :seorel_image_field

        if args[0].class.name == 'Hash'
          class_variable_set '@@seorel_title_field',       args[0][:title]
          class_variable_set '@@seorel_description_field', args[0][:description] || args[0][:title]
          class_variable_set '@@seorel_image_field',       args[0][:image]
        else
          class_variable_set '@@seorel_title_field',       args[0]
          class_variable_set '@@seorel_description_field', args[1] || args[0]
          class_variable_set '@@seorel_image_field',       args[2]
        end

        has_one :seorel, as: :seorelable,
                         dependent: :destroy,
                         class_name: 'Seorel::Seorel',
                         autosave: true,
                         inverse_of: :seorelable

        accepts_nested_attributes_for :seorel, allow_destroy: true

        delegate :title, :title?, :description, :description?, :image, :image?,
          to: :seorel, prefix: :seo, allow_nil: true

        before_save :set_seorel
      end
    end
  end
end
