# == Schema Information
# Schema version: 20101217194341
#
# Table name: forums
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  parent_id   :integer(4)
#  actif       :boolean(1)      default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime
#  description :string(255)
#

class Forum < ActiveRecord::Base
  attr_accessible :name, :description
  
  #relationships
  has_many :forums, :class_name => "Forum", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Forum"
  has_many :topics
  
  #scopes
  scope :without_parent, where('forums.parent_id IS NULL')
  scope :not_too_nested, joins("left join forums  parent on forums.parent_id=parent.id").where('parent.parent_id IS NULL')
  default_scope where :actif => true
  #validations
  validates :name ,:presence => true, :uniqueness => true
  validates :description, :presence => true
end
