class PagesController < ApplicationController
  def home
    @skills = Skill.all
  end

  def about
  end

  def contact
    @phone_number = "7915643"
  end
end
