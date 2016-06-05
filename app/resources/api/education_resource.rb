class Api::EducationResource < Api::BaseResource
  attribute :school_name
  attribute :started
  attribute :graduated
  attribute :description

  has_one :person
end
