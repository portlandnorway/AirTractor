class ApplicationController < ActionController::Base
  layout :layout_by_resource
  private
  def layout_by_resource
    if devise_controller?
      "no_navbar_layout"
    else
      "application"
    end
  end
end
