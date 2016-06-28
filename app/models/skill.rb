class Skill < ActiveRecord::Base
  belongs_to :people

  has_and_belongs_to_many :projects, :join_table => :projects_skills
end
