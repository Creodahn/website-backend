class Project < ActiveRecord::Base
  belongs_to :people
  belongs_to :work_experiences

  has_many :images, as: :imagable
  has_and_belongs_to_many :skills, :join_table => :projects_skills
end
