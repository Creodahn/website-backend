class Api::ImageResource < Api::BaseResource
  attribute :file_name
  attribute :url
  attribute :description

  has_one :project
  has_one :person
end
