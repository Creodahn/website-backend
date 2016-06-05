class Project < ActiveRecord::Base
  belongs_to :people
  belongs_to :work_experiences
  has_many :images
end
