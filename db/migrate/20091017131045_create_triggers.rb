class CreateTriggers < ActiveRecord::Migration
  def self.up
    create_table :triggers do |t|
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :triggers
  end
end
