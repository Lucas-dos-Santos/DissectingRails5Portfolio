class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: ->(attrs) { attrs['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
    where(subtitle: 'angular')
  end

  def self.by_position
    order('position ASC')
  end

  scope :ruby_portfolio_items, -> { where(subtitle: 'ruby') }
end
