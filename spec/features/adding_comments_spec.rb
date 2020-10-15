require 'rails_helper'

RSpec.feature "Adding reviews to Articles" do
  before do
    @john = User.create(email: "john@exemple.com", password: "password")
    @fred = User.create(email: "fred@exemple.com", password: "password")
    @article = Article.create!(title: "Title One", body: "Body of article one", author: "john", user: @john)
  end

  scenario "permits a signed in user to write a review" do
    visit new_user_session_path
    fill_in :user_email, with: 'fred@exemple.com'
    fill_in :user_password, with: 'password'
    click_on 'Log in'

    visit "/"

    click_link @article.title.capitalize
    fill_in "New Comment", with: "An amazing article"
    click_button "Add Comment"

    expect(page).to have_content("Comment has been successfully created")
    expect(page).to have_content("An amazing article")
    expect(current_path).to eq(article_path(@article))
  end

end
