class Caption < ActiveRecord::Base
  validates :text, :presence => true

  belongs_to :user
  belongs_to :captionable, polymorphic: true
  has_many :captions, as: :captionable, :dependent => :destroy

end
