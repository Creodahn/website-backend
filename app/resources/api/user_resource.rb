class Api::UserResource < JSONAPI::Resource
  attribute :authenticated_at
  attribute :authentication_token
  attribute :username

  has_one :person

  filter :username, apply: -> (records, value, options) {
    records.where(id: records.map{|r| r.id if r.username == value.first})
    # User.find_by_username(value)
  }
end
