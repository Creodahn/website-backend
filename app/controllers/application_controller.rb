class ApplicationController < JSONAPI::ResourceController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # before_filter :check_auth!, :only => [:create, :update, :delete]
  skip_before_action :ensure_valid_accept_media_type, if: "Rails.env.development?"

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
    User.find_by_authentication_token(bearer_token)
  end

  def validate_current_user!
    head :unauthorized if current_user.is_a? nil || current_user.blank?
  end
end
