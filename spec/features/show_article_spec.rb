require "rails_helper"

RSpec.feature "Show article" do

  before do
    @article = Article.create(title: "first title", body: "body", author: "alex")
  end

  scenario 'A user goes to show page' do
  visit "/"

  click_link @article.title

  expect(page).to have_content(@article.title)
  expect(page).to have_content(@article.body)
  expect(current_path).to eq(article_path(@article))
end
end
