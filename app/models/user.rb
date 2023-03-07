class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  validates(:username, { :presence => true })
  validates(:username, { :uniqueness => true })

  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:sent_follow_requests, { :class_name => "FollowRequest", :foreign_key => "sender_id", :dependent => :destroy })
  has_many(:received_follow_requests, { :class_name => "FollowRequest", :foreign_key => "recipient_id", :dependent => :destroy })
  has_many(:own_stories, { :class_name => "Story", :foreign_key => "owner_id", :dependent => :destroy })

  has_many(:following, { :through => :sent_follow_requests, :source => :recipient })
  has_many(:followers, { :through => :received_follow_requests, :source => :sender })
  has_many(:bookmarked_stories, { :through => :bookmarks, :source => :story })
  has_many(:feed, { :through => :following, :source => :own_stories })
  has_many(:activity, { :through => :following, :source => :bookmarked_stories })
end
