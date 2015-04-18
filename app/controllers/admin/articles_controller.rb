class Admin::ArticlesController < Admin::ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.page(params[:page]).per(5)
  end

  def show
    @comments = @article.comments.recent.limit(10).all
    if request.path != admin_article_path(@article)
      redirect_to [:admin, @article], status: :moved_permanently
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.administrator = current_administrator
    if @article.save
      SubscriptionsJob.perform(@article)
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
      params.require(:article).permit(:name, :content, :administrator_id)
    end

    def find_article
      @article = Article.includes(:comments).friendly.find(params[:id])
    end

end
