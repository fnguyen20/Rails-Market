
require 'rails_helper'

describe 'show' do
    before do
      visit topic_path(@topic)
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'should display the topic title' do
      expect(page).to have_css('h1', text: 'Sports')
    end

    it 'should have a url that matches the custom url slug' do
      expect(current_path).to have_content('sports')
    end

    it 'allows users to create a new topic from the /new page' do
      visit new_topic_path

      fill_in 'topic[title]', with: "Star Wars"

      click_on "Save"

      expect(page).to have_content("Star Wars")
    end
  end
