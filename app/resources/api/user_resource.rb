class Api::UserResource < JSONAPI::Resource
  attribute :authenticated_at
  attribute :authentication_token
  attribute :username

  has_one :person

  filter :username
end
