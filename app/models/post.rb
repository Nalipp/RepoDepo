class Post < ActiveRecord::Base
  acts_as_votable

  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, length: { maximum: 150 }

  def score
  self.get_upvotes.size - self.get_downvotes.size
  end

  def url_parse(link)
    URI.parse('link').host
  end

end
