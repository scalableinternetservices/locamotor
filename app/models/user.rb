class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable
  has_many :created_posts, :foreign_key => "creator_id", :class_name => "Post"
  has_many :claimed_posts, :foreign_key => "claimer_id", :class_name => "Post"
  has_many :reservations, :class_name => "Reservation"
  has_many :route_requests, :class_name => "RouteRequest"

  # The id's of users that this user has rated
  has_many :ratings_for, :foreign_key => "rated_id", :class_name => "Rating"

  # The id's of users that have rated this user
  has_many :ratings_of, :foreign_key => "rater_id", :class_name => "Rating"

  before_save { self.email = email.downcase }
  # validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :rating, :inclusion => { :in => 0..5 }

  def okie
    puts "#{email}"
  end

  def get_rating
    if ratings_for.size == 0
      return 0
    end

    return ratings_for.sum(:rated_value) / ratings_for.size
  end

  def get_num_reviews
    return ratings_for.size
  end

end
