require 'rails_helper'

describe 'user edits category' do
  scenario 'a user can edit a preexisting category' do
    category = Category.create(title: 'cool man jones')

    visit categories_path

    click_on     'Edit'
    fill_in      "category[title]", with: 'suh dude'
    click_button 'Update Category'

    expect(page).to have_content('suh dude')
  end
end