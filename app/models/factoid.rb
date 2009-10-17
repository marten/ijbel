class Factoid < ActiveRecord::Base
  has_many :triggers
  has_many :responses
end
