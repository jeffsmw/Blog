class Contact < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true
  validates :subject, presence: true
  validates :email, presence: true, format: VALID_EMAIL_REGEX
  validates :message, presence:true


end
