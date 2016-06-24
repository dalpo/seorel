# frozen_string_literal: true
require 'seorel/helper/manager'

module Seorel
  module Helper
    def seorel_manager
      @seorel_manager ||= ::Seorel::Helper::Manager.new(request, seorel_params)
    end

    def render_meta_tags
      seorel_manager.render
    end
  end
end
