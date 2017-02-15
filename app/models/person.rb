class Person < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 100 }

  before_save :email_case

  belongs_to :profile_picture, :class_name => 'Image'
  belongs_to :user

  has_many :blog_posts
  has_many :educations
  has_many :work_experiences
  has_many :projects
  has_many :skills
  has_many :images, as: :imagable

  def email_case
    email.downcase!
  end
end
