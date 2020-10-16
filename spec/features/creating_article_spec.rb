require "rails_helper"

RSpec.feature "Creating Articles" do

  let(:create_article) do
          @article = Article.create(title: 'Creating a blog', body: 'capybara', author: "Alex")
        end

  before do
    @john = User.create!(email: "john@example.com", password: "password")
    visit new_user_session_path
    fill_in :user_email, with: 'john@example.com'
    fill_in :user_password, with: 'password'
    click_on 'Log in'
  end

  scenario "A user creates a new article" do

    visit new_article_path
    page.fill_in "Title", with: "Creating a blog"
    find('#body').set('capybara')
    page.fill_in "Author", with: "Alex"

    click_button "Create Article"
    create_article
    expect(response).to have_http_status(:redirect)
    expect(@article.user).to eq(@john)
    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
    expect(page).to have_content("#{Article.last.author}")
  end

  scenario "A user fails to create a new article" do
    visit "/"

    click_link "New Article"

    fill_in "Title", with: ""
    find('#body').set('')
    fill_in "Author", with: ""

    click_button "Create Article"

    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    # expect(page).to have_content("Body can't be blank")
    expect(page).to have_content("Author can't be blank")
  end
end
