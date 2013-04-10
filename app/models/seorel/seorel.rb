# encoding: utf-8
module Seorel
  class Seorel < ActiveRecord::Base

    belongs_to :seorelable, polymorphic: true

    mount_uploader :image, Seorel::ImageUploader

    before_save do
      self.title = ::ActionController::Base.helpers.strip_tags(self.title).first(255) if self.title?
      self.description = ::ActionController::Base.helpers.strip_tags(self.description).first(255) if self.description?
    end

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
