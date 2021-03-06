require 'rails_helper'

describe 'listing' do
  before do
    @topic = Topic.create(title: "Sports")
  end

  describe 'nested route' do
    it 'has an index page properly nested under a topic' do
      visit topic_listings_path(topic_id: @topic)
      expect(page.status_code).to eq(200)
    end
  end
end