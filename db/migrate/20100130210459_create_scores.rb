class CreateScores < ActiveRecord::Migration
  def self.up
    create_table :scores do |t|
      t.references :node
      t.integer :score
      t.integer :variant

      t.timestamps
    end
  end

  def self.down
    drop_table :scores
  end
end
