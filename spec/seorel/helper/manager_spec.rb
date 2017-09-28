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
      config.default_keywords = 'SEO,KEY'

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
        "<meta name=\"description\" content=\"Sample description\" />",
        "<meta name=\"keywords\" content=\"SEO,KEY\" />",
        "<meta property=\"og:title\" content=\"Sample title\" />",
        "<meta property=\"og:description\" content=\"Sample description\" />",
        "<meta property=\"og:locale\" content=\"en_EN\" />",
        "<meta property=\"og:url\" content=\"http://www.example.com/\" />",
        "<meta property=\"og:type\" content=\"website\" />",
        "<meta name=\"twitter:title\" content=\"Sample title\" />",
        "<meta name=\"twitter:description\" content=\"Sample description\" />",
        "<meta name=\"twitter:url\" content=\"http://www.example.com/\" />",
        "<meta name=\"twitter:card\" content=\"summary_large_image\" />"
      ].join
    end
  end
end
