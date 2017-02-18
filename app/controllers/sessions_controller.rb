class SessionsController < ApplicationController
  skip_before_action :validate_current_user, :only => [:create]

  def create
    u = User.find_by(username: params[:username])

    return invalid_login_attempt unless u

    if u.authenticate(params[:password])
      auth_token = u.generate_auth_token
      render json: { authentication_token: auth_token }
    else
      invalid_login_attempt
    end
  end

  def destroy
    u = current_user
    u.invalidate_auth_token
    head :ok
  end

  private

  def invalid_login_attempt
    render json: { errors: [ { detail: "Error with your login or password" }]}, status: 401
  end
end
