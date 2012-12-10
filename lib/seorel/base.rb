module Seorel
  module Base

    def seorel(base_field = nil, options = {})
      include InstanceMethods
      extend  ClassMethods

      @seorel_base_field = base_field.to_sym

      has_one :seorel, as: :seorelable, dependent: :destroy, class_name: 'Seorel::Seorel'
      accepts_nested_attributes_for :seorel, allow_destroy: false

      after_save :build_seorel, unless: :seorel?
      before_save :set_empty_fields

      attr_accessible :seorel_attributes

      # default_scope includes(:seorel)
    end

  end
end
