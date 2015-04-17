class Article < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :history

  acts_as_commentable

  belongs_to :administrator

  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :slug, uniqueness: true

  default_scope{ order('created_at DESC') }


end
