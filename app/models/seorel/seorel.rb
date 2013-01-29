module Seorel
  class Seorel < ActiveRecord::Base

    belongs_to :seorelable, polymorphic: true

    mount_uploader :image, Seorel::ImageUploader

    attr_accessible :description, :title, :image

    def new_record?
      false
    end

    def admin_label
      I18n.t("seorel.admin.label")
    end

  end
end
