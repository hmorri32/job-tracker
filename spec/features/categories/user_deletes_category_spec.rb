require 'rails_helper'

describe "User can delete a category" do
  scenario "user can delete a category" do
    Category.create(title: 'illest')
    Category.create(title: 'cool stuff')

    visit categories_path

    first(:link, "Delete").click
    expect(page).to have_content('cool stuff was successfully deleted!')
  end
end