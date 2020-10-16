require "rails_helper"

RSpec.describe "Comments", type: :request do

  before do
    @john = User.create(email: "john@exemple.com", password: "password")
    @fred = User.create(email: "fred@exemple.com", password: "password")
    @article = Article.create!(title: "Title One", body: "Body of article one", author: "john", user: @john)
  end
  describe "POST /articles/:id/comments" do
    context "with a non signed-in user" do
      before do
        post "/articles/#{@article.id}/comments", params: { comment: {body: "Awesome blog"}}
      end

      it "redirect user to the signin page" do
        flash_message = "Please sign in or sign up first"
        expect(response).to redirect_to(new_user_session_path)
        expect(response.status).to eq 302
        expect(flash[:alert]).to eq(flash_message)
      end
    end
  end

  context "with a logged in user" do
    before do
      get new_user_session_path
    fill_in :user_email, with: 'fred@exemple.com'
    fill_in :user_password, with: 'password'
    click_on 'Log in'
      post "/articles/#{@article.id}/comments", params: { comment: {body: "Awesome blog"}}
    end
    it "create the comment successfully" do
      flash_message = "Comment has been successfully created"
      expect(response).to redirect_to(article_path(@article))
      expect(response.status).to eq 302
      expect(flash[:notice]).to eq (flash_message)
    end
  end
end
