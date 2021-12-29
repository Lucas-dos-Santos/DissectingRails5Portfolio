class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs_topics
  has_many :blogs, through: :blogs_topics
end
