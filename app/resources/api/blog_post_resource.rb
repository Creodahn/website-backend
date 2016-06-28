class Api::BlogPostResource < Api::BaseResource
  attribute :content
  attribute :created_at
  attribute :title
  attribute :updated_at

  has_one :person
end
