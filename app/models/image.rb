class Image < ActiveRecord::Base
  belongs_to :people
  belongs_to :imagable, polymorphic: true
end
