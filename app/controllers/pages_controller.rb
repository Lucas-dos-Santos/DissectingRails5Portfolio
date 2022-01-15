class PagesController < ApplicationController
  def home
    @page_title = 'Home'
  end

  def about
    @skills = Skill.all.order(:created_at)
    @page_title = 'About me'
  end

  def contact
    @page_title = 'Contact'
  end
end
