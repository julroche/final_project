class Activity < ActiveRecord::Base
  attr_accessible :activity_name, :user_id, :activity_icon

  belongs_to :user
  has_many :events, :dependent => :destroy

 	has_attached_file :activity_icon

  validates_presence_of :activity_name
  validates_presence_of :user_id
  validates_uniqueness_of :activity_name
end
