class Api::AlbumResource < Api::BaseResource
  attribute :created_at
  attribute :description
  attribute :title
  attribute :updated_at

  has_one :person

  has_many :images
end
