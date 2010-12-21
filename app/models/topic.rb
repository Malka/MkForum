# == Schema Information
# Schema version: 20101217194341
#
# Table name: topics
#
#  id         :integer(4)      not null, primary key
#  author_id  :integer(4)
#  forum_id   :integer(4)
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Topic < ActiveRecord::Base
  attr_accessible :title, :content
  attr_accessor :content
  belongs_to :author, :class_name => "User"
  belongs_to :forum
  has_many :posts
  #validations
  validates :title, :presence => true
  validates :content, :presence => true
  # validates :author_id, :presence => true
  validates :forum_id, :presence => true
  
end
