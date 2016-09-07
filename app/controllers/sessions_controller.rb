class SessionsController < ApplicationController
  skip_before_filter :check_auth!
  before_filter :login!

  private
  def login!
    p = Person.find_by(email: params[:email])

    if p && p.valid_password(params[:password])
      current_user = p
      current_user.update_attributes(
        authenticated_at: DateTime.now,
        authentication_token: SecureRandom.uuid
      )
    else
      raise "error"
    end
  end
end
