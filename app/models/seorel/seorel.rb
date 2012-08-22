module Seorel
  class Seorel < ActiveRecord::Base
    
    belongs_to :seorelable, polymorphic: true
    attr_accessible :description, :title

  end
end
