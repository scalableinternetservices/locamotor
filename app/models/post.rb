class Post < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :vehicle, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :start_time, presence: true

  validates :end_time, presence: true

  validates :price, presence: true
end
