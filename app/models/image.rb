class Image < ActiveRecord::Base
  validates :img, :presence => true
  belongs_to :user
  has_many :captions, as: :captionable, :dependent => :destroy
  scope :ranking, -> { select("id, img, user_id, upvotes, downvotes, created_at,
   hot_score(upvotes, downvotes, created_at) as hot_score").
   order("hot_score desc") }
end
