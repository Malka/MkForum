class Post < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :title, :content, :author_id
  
  validates :content, :presence => true
end
