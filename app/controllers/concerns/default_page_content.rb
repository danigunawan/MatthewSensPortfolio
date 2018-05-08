module DefaultPageContent
    extend ActiveSupport::Concern

    included do
      before_action :set_page_defaults
    end

    def set_page_defaults
      @page_title = "Matthew Israelson's Portfolio | My Portfolio Website"
      @seo_keywords = "Matthew Israelson portfolio"
    end
  end