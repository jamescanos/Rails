class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # It looks for filtered params
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end

  end

  def edit

    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  
  end

  def destroy
    
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path

  end

  #Strong Parameters to filter params
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

end
