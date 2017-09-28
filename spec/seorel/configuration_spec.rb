require 'spec_helper'

RSpec.describe Seorel::Configuration do
  after :each do
    Seorel.reset!
  end

  describe '#default_og_metas' do
    subject { Seorel.config.default_og_metas }

    context 'without any configuration' do
      it { expect(Seorel.config.default_og_metas).to eq({}) }
    end

    context 'after a configuration' do
      before do
        Seorel.configure do |conf|
          conf.default_og_metas = {
            type: 'website'
          }
        end
      end

      it { expect(Seorel.config.default_og_metas).to eq(type: 'website') }
    end
  end

  describe '#default_twitter_metas' do
    subject { Seorel.config.default_twitter_metas }

    context 'without any configuration' do
      it { is_expected.to eq({}) }
    end

    context 'after a configuration' do
      before do
        Seorel.configure do |conf|
          conf.default_twitter_metas = {
            card: 'summary_large_image'
          }
        end
      end

      it { is_expected.to eq(card: 'summary_large_image') }
    end
  end
end
