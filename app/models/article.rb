class Article < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :content, presence: true

  default_scope{ order('created_at DESC') }
end
