class Skill < ApplicationRecord
  # include Placeholder
  validates_presence_of :title, :percent_utilized

  # after_initialize :set_defaults
  #
  # def set_defaults
  #   # Placeholder is a helper method inside concerns that we can now call inside our models
  #   self.badge ||= Placeholder.image_generator(height: 250, width: 250)
  # end
end
