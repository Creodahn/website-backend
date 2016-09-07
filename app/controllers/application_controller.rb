class ApplicationController < JSONAPI::ResourceController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :check_auth!

  def context
    {current_user: current_user,
     token: bearer_token}
  end

  private
  def bearer_token
    pattern = /^Bearer /
    header  = request.env['HTTP_AUTHORIZATION']
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def current_user
    Person.find_by_authentication_token(bearer_token)
  end

  def check_auth!
    if valid_token(params[:token])
      current_user
    else
      raise "error"
    end
  end

  def valid_token(token)
    p = current_user
    p && p.authenticated_at < DateTime.now - 1.day
  end
end
