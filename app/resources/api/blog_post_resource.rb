class Api::BlogPostResource < Api::BaseResource
  attribute :content
  attribute :title

  has_one :person
end
