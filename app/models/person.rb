class Person < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 8 }

  before_save :email_case

  belongs_to :profile_picture, :class_name => 'Image'

  has_many :blog_posts
  has_many :educations
  has_many :work_experiences
  has_many :projects
  has_many :skills
  has_many :images, as: :imagable

  has_secure_password

  def email_case
    email.downcase!
  end
end
