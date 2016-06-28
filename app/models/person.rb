class Person < ActiveRecord::Base
  belongs_to :profile_picture, :class_name => 'Image'

  has_many :blog_posts
  has_many :educations
  has_many :work_experiences
  has_many :projects
  has_many :skills
  has_many :images, as: :imagable
end
