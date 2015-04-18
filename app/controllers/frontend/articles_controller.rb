class Frontend::ArticlesController < Frontend::ApplicationController

  def index
    @articles = Article.all.page(params[:page]).per(5)
  end

  def show
    @article = Article.includes(:comments).friendly.find(params[:id])
    @comments = @article.comments.recent.limit(10).all
    @comment = @article.comments.new
  end

  def new_comment
    @article = Article.friendly.find(params[:id])
    @comment = @article.comments.new
    @comment.title = params[:comment][:title]
    @comment.comment = params[:comment][:comment]

    if @comment.save
      redirect_to [:frontend, @article], notice: "Successfully posted comment."
    else
      redirect_to [:frontend, @article], alert: "Could not post comment."
    end
  end


  private

    def comments_params
      params.require(:comment).permit(:commentable)
    end

end
