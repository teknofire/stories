class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def current_theme
    @current_theme ||= Theme.where(site: true).first
  end
  helper_method :current_theme

  rescue_from CanCan::AccessDenied do |exception|
    if !signed_in?
      save_current_location
      redirect_to signin_path
    else
      redirect_to root_url, :alert => exception.message
    end
  end

  def current_user
    @current_user ||= GlobalID::Locator.locate session[:user_gid]
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    session[:user_gid] = user.to_global_id.to_s
  end

  def save_current_location
    session[:saved_location] = request.original_fullpath
  end

  def redirect_back_or_default(path)
    saved_location = session[:saved_location]
    session[:saved_location] = nil

    redirect_to saved_location || path
  end
end
