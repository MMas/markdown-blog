class Article < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_commentable

  belongs_to :administrator

  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :slug, uniqueness: true

  default_scope{ order('created_at DESC') }

  def should_generate_new_friendly_id?
    new_record?
  end

end
