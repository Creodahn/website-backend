class Api::AlbumResource < Api::BaseResource
  attribute :description
  attribute :title

  has_one :person

  has_many :images
end
