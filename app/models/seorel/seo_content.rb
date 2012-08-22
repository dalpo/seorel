module Seorel
  class SeoContent < ActiveRecord::Base
    belongs_to :seorelable
    attr_accessible :description, :title
  end
end
