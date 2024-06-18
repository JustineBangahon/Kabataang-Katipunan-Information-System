class ApplicationController < ActionController::Base
    helper_method :admin_logged_in?
  
    def admin_logged_in?
      !!session[:admin_id]
    end
  
    # Ensure that admin is logged in for certain actions
    def require_admin_logged_in
      redirect_to login_path unless admin_logged_in?
    end
  end
  