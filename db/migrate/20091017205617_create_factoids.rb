class CreateFactoids < ActiveRecord::Migration
  def self.up
    create_table :factoids do |t|
      t.timestamps
    end
    
    add_column :triggers,  :factoid_id, :integer
    add_column :responses, :factoid_id, :integer
    
    drop_table :responses_triggers
  end

  def self.down
    raise IrreversibleMigration
  end
end
