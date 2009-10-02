class CreateMemos < ActiveRecord::Migration
  def self.up
    create_table :memos do |t|
      t.string :name
      t.string :note
      t.integer :p_first
      t.integer :p_last
      t.integer :t_first
      t.integer :t_last
      t.integer :m
      t.integer :n

      t.timestamps
    end
  end

  def self.down
    drop_table :memos
  end
end
