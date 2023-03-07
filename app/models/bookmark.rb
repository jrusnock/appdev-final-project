class Bookmark < ApplicationRecord
  validates(:user_id, { :presence => true })
  validates(:story_id, { :presence => true })
  validates(:story_id, { :uniqueness => { :scope => ["user_id"], :message => "already liked" } })

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:story, { :required => true, :class_name => "Story", :foreign_key => "story_id", :counter_cache => :boomarks_count })
end
