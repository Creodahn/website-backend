class SessionsController < ApplicationController
  skip_before_action :validate_current_user, :only => [:create]

  def create
    u = User.find_by_username(params[:username])

    return invalid_login_attempt unless u

    if u.authenticate(params[:password])
      authentication_token = u.generate_authentication_token
      render json: { authentication_token: authentication_token }
    else
      invalid_login_attempt
    end
  end

  def destroy
    u = current_user
    u.invalidate_authentication_token
    head :ok
  end

  private

  def invalid_login_attempt
    render json: { errors: [ { detail: "Error with your login or password" }]}, status: 401
  end
end
