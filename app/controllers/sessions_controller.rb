class SessionsController < ApplicationController
  # skip_before_filter :check_auth!
  before_filter :login!

  private
  def login!
    u = User.find_by(email: params[:email])

    if u && u.valid_password(params[:password])
      current_user = u
      current_user.update_attributes(
        authenticated_at: DateTime.now,
        authentication_token: SecureRandom.uuid
      )
    else
      raise "error"
    end
  end
end
