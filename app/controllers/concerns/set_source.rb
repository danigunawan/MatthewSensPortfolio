module SetSource
  # extending ActiveSupport allows us to have included do and other stuff
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  def set_source
    session[:source] = params[:q] if params[:q]
  end

end
