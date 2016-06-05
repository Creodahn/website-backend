class Api::WorkExperienceResource < Api::BaseResource
  attribute :company
  attribute :description
  attribute :ended
  attribute :started
  attribute :title
  attribute :url

  has_many :projects
end
