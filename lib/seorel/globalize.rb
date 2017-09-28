# frozen_string_literal: true

require 'globalize'
require 'seorel/seorel'
require 'active_support/concern'

module Seorel
  module Globalize
    extend ActiveSupport::Concern

    included do
      translates :title, :description, :image
    end
  end
end

Seorel::Seorel.include Seorel::Globalize
