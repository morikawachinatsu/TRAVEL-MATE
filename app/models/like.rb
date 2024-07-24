class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  validates_uniqueness_of :tweet_id, scope: :user_id
  default_scope { order(position: :asc) }
end
