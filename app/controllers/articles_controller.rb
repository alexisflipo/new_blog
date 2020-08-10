class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "Article has been created"
    else
      flash.now[:error] = "Cannot create article"
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
