class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
      flash[:notice] = 'Article created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def new
    @article = Article.new
  end

  def update

    if @article.update(article_params)
      redirect_to @article
      flash[:notice] = 'Article updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
    flash[:alert] = 'Article deleted successfully'
  end

  private
  
  def find_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
