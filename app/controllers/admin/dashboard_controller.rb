class Admin::DashboardController < Admin::ApplicationController

  def index
    @article_count = Article.all.count
    @comment_count = Comment.all.count
  end
  
end
