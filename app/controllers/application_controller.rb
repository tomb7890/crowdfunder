class ApplicationController < ActionController::Base

  def not_authenticated
    redirect_to login_url, :alert => "Please log in before trying to visit this page."
  end 
end
