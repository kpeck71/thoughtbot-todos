require "rails_helper"

feature "User creates todo" do
  scenario "successfully" do
    visit new_todo_path
    expect(page).to have_css 'h1', text: 'Create Todo'
    click_on "Add a new todo"
    fill_in "Title", with: "Buy milk"
    click_on "Submit"
    expect(page).to have_css '.todos li', text: 'Buy milk'
  end
end
