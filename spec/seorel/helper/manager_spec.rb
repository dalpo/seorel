require 'spec_helper'

RSpec.describe Seorel::Helper::Manager do
  let(:seorel_params) { Seorel::Controller::Params.new }

  subject(:manager) do
    Seorel::Helper::Manager.new(FakeRequest.factory, seorel_params)
  end

  before :each do
    Seorel.configure do |config|
      config.default_title = 'Sample title'
      config.default_description = 'Sample description'

      config.default_og_metas = {
        type: 'website'
      }

      config.default_twitter_metas = {
        card: 'summary_large_image'
      }
    end
  end

  after :each do
    Seorel.reset!
  end

  describe '#render' do
    it 'should render all declared meta tags' do
      expect(manager.render).to eq [
        "<title>Sample title</title>",
        "<meta name=\"description\" content=\"Sample description\"></meta>",
        "<meta property=\"og:title\" content=\"Sample title\"></meta>",
        "<meta property=\"og:description\" content=\"Sample description\"></meta>",
        "<meta property=\"og:locale\" content=\"en_EN\"></meta>",
        "<meta property=\"og:url\" content=\"http://www.example.com/\"></meta>",
        "<meta property=\"og:type\" content=\"website\"></meta>",
        "<meta name=\"twitter:title\" content=\"Sample title\"></meta>",
        "<meta name=\"twitter:description\" content=\"Sample description\"></meta>",
        "<meta name=\"twitter:url\" content=\"http://www.example.com/\"></meta>",
        "<meta name=\"twitter:card\" content=\"summary_large_image\"></meta>"
      ].join
    end
  end
end
