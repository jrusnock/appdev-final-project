# == Schema Information
#
# Table name: stories
#
#  id             :integer          not null, primary key
#  boomarks_count :integer
#  description    :text
#  story          :text
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Story < ApplicationRecord
  validates(:story, { :presence => true })
  validates(:owner_id, { :presence => true })

  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id", :counter_cache => :own_stories_count })
  has_many(:boomarks, { :class_name => "Bookmark", :foreign_key => "story_id", :dependent => :destroy })

  has_many(:fans, { :through => :boomarks, :source => :user })
  has_many(:followers, { :through => :owner, :source => :following })
  has_many(:fan_followers, { :through => :fans, :source => :following })
end
