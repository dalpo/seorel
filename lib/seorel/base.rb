module Seorel
  module Base

    def seorelify(base_field = nil, options = {})
      include InstanceMethods
      extend  ClassMethods

      cattr_accessor :seorel_base_field, :seorel_options

      class_variable_set '@@seorel_base_field', base_field
      class_variable_set '@@seorel_options', options

      has_one :seorel, as: :seorelable, dependent: :destroy, class_name: 'Seorel::Seorel'
      accepts_nested_attributes_for :seorel, allow_destroy: false

      after_initialize :build_seorel, unless: :seorel?
      after_initialize :set_seorel_default_values
      before_save :set_seorel_default_values

      delegate :title, :description, :image, :image?, to: :seorel, prefix: :seo, allow_nil: true

      attr_accessible :seorel_attributes
    end

  end
end
