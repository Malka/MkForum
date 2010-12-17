class Topic < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :forum
  
  #validations
  validates :title, :presence => true
  validates :author_id, :presence => true
  validates :forum_id, :presence => true
end
