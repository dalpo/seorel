# frozen_string_literal: true
require 'active_record'

module Seorel
  class Seorel < ::ActiveRecord::Base
    belongs_to :seorelable, polymorphic: true, touch: true

    def title?
      self.title.present?
    end

    def description?
      self.description.present?
    end

    def image?
      self.image.present?
    end

    def admin_label
      I18n.t("seorel.admin.label")
    end
  end
end
