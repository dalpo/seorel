require 'seorel/helper/generic'
require 'seorel/helper/open_graph'
require 'seorel/helper/twitter'

# encoding: utf-8
module Seorel
  module Helper
    class Manager
      attr_reader :request, :params

      def initialize(request, params)
        @request = request
        @params = params
      end

      def generic
        @generic ||= ::Seorel::Helper::Generic.new(request, params)
      end

      def open_graph
        @open_graph ||= ::Seorel::Helper::OpenGraph.new(request, params)
      end

      def twitter
        @twitter ||= ::Seorel::Helper::Twitter.new(request, params)
      end

      def all
        (generic.all + open_graph.all + twitter.all)
      end

      def render
        all.join.html_safe
      end
    end
  end
end
