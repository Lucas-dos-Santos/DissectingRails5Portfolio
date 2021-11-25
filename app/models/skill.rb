class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilized
  # another way
  # validates :title, presence: true
end
