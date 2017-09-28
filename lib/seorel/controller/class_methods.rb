# frozen_string_literal: true
# encoding: utf-8

module Seorel
  module Controller
    module ClassMethods
      def add_seorel_meta(values = {})
        class_name = name

        before_filter options do |controller|
          controller.send :add_meta, values
        end
      end
    end
  end
end
