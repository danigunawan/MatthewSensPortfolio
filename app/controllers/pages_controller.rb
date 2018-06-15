class PagesController < ApplicationController

  def home
    @skills = Skill.all
    @tweets = SocialTool.twitter_search
  end

  def about
  end

  def contact
    @phone_number = "7915643"
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end
    head :ok
  end

end
