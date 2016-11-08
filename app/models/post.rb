class Post < ApplicationRecord
  belongs_to :creator, :class_name => "User"
  # belongs_to :claimer, :class_name => "User"
  belongs_to :start_location, :class_name => "Location"

  has_many :photos

  has_many :reservations, :foreign_key => "post_id", :class_name => "Reservation"

  before_save { self.email = email.downcase }
  validates :vehicle, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

                  #  uniqueness: { case_sensitive: false }


  validates :start_time, presence: true

  validates :end_time, presence: true

  validates :price, presence: true

  validates :post_type, presence: true

#  validates :auto_book, presence: true
end
