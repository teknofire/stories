class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def new
    redirect_to '/auth/google'
  end

  def create
    unless @auth = Authorization.find_from_hash(authhash)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(authhash, current_user)
    end

    signin_user(@auth.user)

    redirect_back_or_default('/')
  end

  def destroy
    signout
    redirect_back_or_default('/')
  end

  def failure
    flash[:error] = failure_message
    redirect_back_or_default('/')
  end

  protected

  def failure_message
    case params[:message]
    when 'invalid_credentials'
      "Invalid login credentials"
    else
      "Unknown error while logging in (#{params[:message]})"
    end
  end


  def signin_user(user)
    session[:user_gid] = user.to_global_id.to_s
  end

  def signout
    session[:user_gid] = nil
  end

  def authhash
    request.env['omniauth.auth']
  end
end
