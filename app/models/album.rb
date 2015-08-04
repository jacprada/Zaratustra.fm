class Album < ActiveRecord::Base
  acts_as_votable

  belongs_to :user
  belongs_to :playlist

  validates :title, presence: true
  validates :artist, presence: true
  validates :user_id, presence: true
  validates :review, length: { maximum: 140 }

  def thumbs_up
    self.get_upvotes.size
  end

  def thumbs_down
    self.get_downvotes.size
  end

end