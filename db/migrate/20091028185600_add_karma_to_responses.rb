class AddKarmaToResponses < ActiveRecord::Migration
  def self.up
    add_column :responses, :karma, :int, :default => 0, :null => false
  end

  def self.down
    remove_column :responses, :karma
  end
end
