module Seorel
  class Seorel < ActiveRecord::Base

    belongs_to :seorelable, polymorphic: true
    attr_accessible :description, :title

    def new_record?
      false
    end

    def admin_label
      I18n.t("seorel.admin.label")
    end

    rails_admin do
      visible false
    end

  end
end
