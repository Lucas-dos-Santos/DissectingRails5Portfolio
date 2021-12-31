class PagesController < ApplicationController
  def home; end

  def about
    @skills = Skill.all.order(:created_at)
  end

  def contact; end
end
