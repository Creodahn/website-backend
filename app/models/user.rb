class User < ActiveRecord::Base
  validates :password, presence: true, length: { minimum: 8 }

  has_one :person

  has_secure_password

  def find_by_authentication_token(token)
    unless token.nil?
      begin
        return User.find_by(authentication_token: token)
      rescue
        return nil
      end
    end
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.base64(12)
  end

  def generate_auth_token
    token = User.new_token
    self.update_columns(authentication_token: token)
    token
  end

  def invalidate_auth_token
    self.update_columns(authentication_token: nil)
  end
end
