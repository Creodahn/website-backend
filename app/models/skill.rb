class Skill < ActiveRecord::Base
  belongs_to :people

  has_many :projects
end
