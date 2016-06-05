class Api::ProjectResource < Api::BaseResource
  attribute :name
  attribute :started
  attribute :ended
  attribute :description
  attribute :url

  has_one :person

  has_many :images
end
