class CreateStuffs < ActiveRecord::Migration
  def self.up
    create_table :stuffs do |t|
      t.integer :subject_id
      t.integer :day_id
      t.integer :sn
      t.string :name
      t.string :note
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :stuffs
  end
end
