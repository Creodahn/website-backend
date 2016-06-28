class Album < ActiveRecord::Base
  belongs_to :person

  has_many :images, as: :imagable
end
