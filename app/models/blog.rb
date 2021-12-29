class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  # enum status: { draft: 0, published: 1 }
  # Tambem poderia ser das duas formas abaixo
  enum status: %i[draft published]
  # enum status: %i[draft published]

  validates_presence_of :title, :body, :topics

  has_many :blogs_topics
  has_many :topics, through: :blogs_topics
  has_many :comments, dependent: :destroy

  def self.recent
    order(created_at: :desc)
  end
end
