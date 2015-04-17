class Admin::ArticlesController < Admin::ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.page(params[:page]).per(5)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to [:admin, @article], notice: "Successfully created article."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to  [:admin, @article], :notice  => "Successfully updated article."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_url, :notice => "Successfully destroyed article."
  end

  private

    def article_params
      params.require(:article).permit(:name, :content)
    end

    def find_article
      @article = Article.find(params[:id])
    end

end
