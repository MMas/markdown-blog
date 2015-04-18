class AddCommentsCountToArticles < ActiveRecord::Migration

  def up
    add_column :articles, :comments_count, :integer, :default => 0

    Article.reset_column_information
    Article.all.collect do |a|
      a.update_attribute(:comments_count, a.comments.count)
    end
  end

  def down
    remove_column :articles, :comments_count
  end

end
