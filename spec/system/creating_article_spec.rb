require "rails_helper"
RSpec.feature "Creating Articles" do
  scenario "A user creates a new article" do
    visit root_path
    click_link('New Article')
    save_and_open_page
    fill_in("Title", with: "Creating a blog")
    fill_in "Body", with: "Lorem Ipsum"
    click_button "Create Article"
    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end
end
