class Trigger < ActiveRecord::Base
  belongs_to :factoid
  has_many :responses, :through => :factoid
  
  validates_presence_of :value
end
