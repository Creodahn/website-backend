class Image < ActiveRecord::Base
  belongs_to :people
  belongs_to :projects
end
