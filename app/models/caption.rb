class Caption < ActiveRecord::Base
  validates :text, :presence => true

  belongs_to :user
  belongs_to :captionable, polymorphic: true
  has_many :captions, as: :captionable, :dependent => :destroy
  scope :ranking, -> { select("id, text, user_id, upvotes, downvotes, created_at,
   hot_score(upvotes, downvotes, created_at) as hot_score").
   order("hot_score desc") }

end
