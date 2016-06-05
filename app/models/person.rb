class Person < ActiveRecord::Base
  belongs_to :profile_picture, :class_name => 'Image'

  has_many :educations
  has_many :work_experiences
  has_many :projects
  has_many :skills
  has_many :images
end
