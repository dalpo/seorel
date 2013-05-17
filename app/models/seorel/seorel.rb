# encoding: utf-8
module Seorel
  class Seorel < ActiveRecord::Base

    belongs_to :seorelable, polymorphic: true, touch: true

    # mount_uploader :image, Seorel::ImageUploader

    def title?
      self.title.present?
    end

    def description?
      self.description.present?
    end

    def admin_label
      I18n.t("seorel.admin.label")
    end

  end
end
