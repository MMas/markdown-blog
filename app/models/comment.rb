class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  validates :comment, presence: true

  default_scope -> { order('created_at ASC') }

  # belongs_to :user

end
