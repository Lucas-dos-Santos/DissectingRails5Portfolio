module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Meu portfolio na web!'
    @seo_keywords = 'Lucas dos Santos portfolio'
  end
end
