class Api::ImageResource < Api::BaseResource
  attribute :file_name
  attribute :url
  attribute :description

  has_one :imagable, polymorphic: true
  has_one :uploader, class_name: "Person"
end
