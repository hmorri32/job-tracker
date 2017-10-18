require 'rails_helper'

describe "User can create a new category" do
  context "valid" do
    scenario "a user creates a new category" do
      visit new_category_path

      fill_in "category[title]", with: "cool title"
      click_button 'Create Category'

      expect(page).to have_content('cool title')
      expect(current_path).to eq("/categories")
    end
  end

  context 'invalid params' do
    scenario 'cannot create a category' do
      visit new_category_path
      click_button 'Create Category'

      expect(current_path).to eql(new_category_path)
    end
  end
end