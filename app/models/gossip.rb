class Gossip < ApplicationRecord
validates :title, 
  presence: true,
  length: { minimum: 3, maximum: 30}
validates :content, presence: true
  
  belongs_to :user
  has_many :gossip_tags
  has_many :tags, through: :gossip_tag
  has_many :comments

  def like!
    increment!(:likes_count)
  end

  def dislike!
    decrement!(:likes_count) if likes_count > 0
  end
end
