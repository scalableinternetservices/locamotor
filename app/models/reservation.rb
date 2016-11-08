class Reservation < ApplicationRecord
  belongs_to :user, :class_name => "User"

  belongs_to :post, :class_name => "Post"

  validates :start_time, presence: true

  validates :end_time, presence: true
end
