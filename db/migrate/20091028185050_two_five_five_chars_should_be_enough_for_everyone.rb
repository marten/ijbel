class TwoFiveFiveCharsShouldBeEnoughForEveryone < ActiveRecord::Migration
  def self.up
    change_column :responses, :value, :string
  end

  def self.down
    change_column :responses, :value, :text
  end
end
