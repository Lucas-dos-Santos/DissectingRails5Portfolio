class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  # enum status: { draft: 0, published: 1 }
  # Tambem poderia ser das duas formas abaixo
  enum status: %i[draft published]
  # enum status: %i[draft published]

  validates_presence_of :title, :body
end
