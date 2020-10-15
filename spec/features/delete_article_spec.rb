require "rails_helper"

RSpec.feature "Deleting an Article" do

  before do
     john = User.create!(email: "john@example.com", password: "password")
    visit new_user_session_path
    fill_in :user_email, with: 'john@example.com'
    fill_in :user_password, with: 'password'
    click_on 'Log in'
    @article = Article.create(title: "first title", body: "body", author: "alex", user: john)
  end

  scenario "Deleting an Article" do
    visit "/"

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(page.current_path).to eq(articles_path)
  end
end
