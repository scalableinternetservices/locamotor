class Post < ApplicationRecord
  belongs_to :creator, :class_name => "User"
  # belongs_to :claimer, :class_name => "User"
  belongs_to :start_location, :class_name => "FullLocation"

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

  # Get the 10 most recent posts every 10 seconds, cache results
  def self.GetRecent
    Rails.cache.fetch("most_recent", expires_in: 10.seconds) do
      Post.last(100)
    end
  end
end
