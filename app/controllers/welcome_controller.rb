class WelcomeController < ApplicationController
  before_action :require_login, :only => :admin

  def index
    
  end

  def admin
    
  end
end
