require "rails_helper"

RSpec.feature "Editing an article" do


  before do
    john = User.create!(email: "john@example.com", password: "password")
    visit new_user_session_path
    fill_in :user_email, with: 'john@example.com'
    fill_in :user_password, with: 'password'
    click_on 'Log in'
    @article = Article.create(title: "first title", body: "body", author: "alex", user: john)
  end

  scenario "A user updates an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "Updated Title"
    fill_in "Body", with: "Updated Body"
    fill_in "Author", with: "Updated Author"
    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))

  end

  scenario "A user fails to update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "Updated Body of Article"
    fill_in "Author", with: "Author updated"
    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
end
