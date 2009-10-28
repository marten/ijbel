class Factoid < ActiveRecord::Base
  has_many :triggers
  has_many :responses
  
  accepts_nested_attributes_for :triggers, :responses
end
