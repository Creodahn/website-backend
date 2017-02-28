class Api::PersonResource < Api::BaseResource
  attribute :birth_date
  attribute :description
  attribute :email
  attribute :linkedin
  attribute :location
  attribute :name
  attribute :resume_url
  attribute :title

  belongs_to :user

  has_one :profile_picture

  has_many :blog_posts
  has_many :educations
  has_many :images
  has_many :projects
  has_many :skills
  has_many :work_experiences

  filter :email
  filter :name
end
