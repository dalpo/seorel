# frozen_string_literal: true

require 'active_record'

module Seorel
  class Seorel < ::ActiveRecord::Base
    belongs_to :seorelable, polymorphic: true, touch: true, inverse_of: :seorel

    def title?
      title.present?
    end

    def description?
      description.present?
    end

    def image?
      image.present?
    end

    def admin_label
      I18n.t('seorel.admin.label')
    end
  end
end
