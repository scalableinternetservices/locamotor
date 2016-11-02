class Rating < ApplicationRecord
    belongs_to :rater, :class_name => "User"
    belongs_to :rated, :class_name => "User"

  scope :rating_by_of, -> (rater_id, rated_id) do
    where("(ratings.rater_id = ? AND ratings.rated_id = ?)", rater_id, rated_id)
  end 
end
