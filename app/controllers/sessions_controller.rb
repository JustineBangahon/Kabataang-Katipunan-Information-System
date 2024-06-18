class SessionsController < ApplicationController
  def new
    redirect_to dashboard_path if admin_logged_in?
  end

  def create
    if params[:session].present? && params[:session][:username].present? && params[:session][:password].present?
      admin = Admin.find_by(username: params[:session][:username])

      if admin && admin.authenticate(params[:session][:password])
        session[:admin_id] = admin.id
        flash[:notice] = 'Successfully logged in'
        redirect_to dashboard_path and return
      end
    end

    flash.now[:error] = 'Invalid username/password combination'
    render 'new'
  end

  def destroy
    session.delete(:admin_id)
    flash[:notice] = 'Successfully logged out'
    redirect_to login_path
  end
end
