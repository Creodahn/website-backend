class Api::SkillResource < Api::BaseResource
  attribute :color
  attribute :description
  attribute :hover_color
  attribute :name
  attribute :years

  has_one :person

  has_many :projects
end
