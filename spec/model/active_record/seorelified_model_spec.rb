require 'spec_helper'

RSpec.describe 'Seorelified model' do
  before do
    Post.instance_eval do
      extend Seorelify
      seorelify :title, :description, :image
    end
  end

  context 'should persist metadata into the seorel table' do
    let!(:model) { Post.create(title: 'Post title', description: 'Post description', image: 'http://weblog.rubyonrails.org/images/rails.png') }
    let(:record) { Seorel::Seorel.first }

    it 'should count 1 record' do
      expect(Seorel::Seorel.count).to eq 1
    end

    it 'should store metadata from the referenced model' do
      expect(model.title).to eq record.title
      expect(model.description).to eq record.description
      expect(model.image).to eq record.image
    end
  end
end
