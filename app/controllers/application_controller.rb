class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate_admin! 
  
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end  
end
