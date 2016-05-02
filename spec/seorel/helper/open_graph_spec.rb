require 'spec_helper'

RSpec.describe Seorel::Helper::OpenGraph do
  let(:seorel_params) { Seorel::Controller::Params.new }

  subject(:open_graph) do
    Seorel::Helper::OpenGraph.new(FakeRequest.factory, seorel_params)
  end

  before :each do
    Seorel.configure do |config|
      config.default_title = 'Sample title'
      config.default_description = 'Sample description'
    end
  end

  after :each do
    Seorel.reset!
  end

  describe '#title' do
    it { expect(open_graph.title).to eq 'Sample title' }
  end

  describe '#description' do
    it { expect(open_graph.description).to eq 'Sample description' }
  end
end
