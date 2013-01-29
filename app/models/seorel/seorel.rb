module Seorel
  class Seorel < ActiveRecord::Base

    belongs_to :seorelable, polymorphic: true

    mount_uploader :image, Seorel::ImageUploader

    attr_accessible :title, :description, :image, :image_cache, :remove_image

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
