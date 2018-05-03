class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: 'ANGULAR')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

#this callback that occurs after the NEW action is called and automatically runs
  after_initialize :set_defaults

  def set_defaults
    # double pipes with equal sign is a shortcut for saying if self.main_image == nil THEN set value to "http://placehold.it/600x400"
    # second way of setting our defaults other is via the migration default:
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x200"
  end
end
