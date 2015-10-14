class Image < ActiveRecord::Base
  validates :img, :presence => true
  belongs_to :user
  has_many :captions, as: :captionable

end
