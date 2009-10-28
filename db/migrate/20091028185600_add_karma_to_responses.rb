class AddKarmaToResponses < ActiveRecord::Migration
  def self.up
    add_column :responses, :karma, :int
  end

  def self.down
    remove_column :responses, :karma
  end
end
