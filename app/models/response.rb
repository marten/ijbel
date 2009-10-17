class Response < ActiveRecord::Base
  belongs_to :factoid
  has_many :triggers, :through => :factoid
  
  validates_presence_of :value
end
