class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  layout 'blacklight'

  protect_from_forgery with: :exception

  before_filter :prepend_view_paths

  def prepend_view_paths
   # prepend_view_path "app/views/catalog/"
  end
end
