class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.text       :value
      t.timestamps
    end

    create_table :responses_triggers, :id => false do |t|
      t.integer :trigger_id
      t.integer :response_id
    end
  end

  def self.down
    drop_table :responses
    drop_table :responses_triggers
  end
end
