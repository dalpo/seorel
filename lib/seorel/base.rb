module Seorel
  module Base

    def seorel(base = nil, options = {})

      has_one :seorel, as: :seorelable, dependent: :destroy, class_name: 'Seorel::Seorel'

    end

  end
end