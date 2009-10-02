class FixTheError < ActiveRecord::Migration
  def self.up
    change_table :memos do |t|
      t.rename :p_last, :p_next
      t.rename :t_last, :t_next
    end
  end

  def self.down
    change_table :memos do |t|
      t.rename :p_next, :p_last
      t.rename :t_next,:t_last 
    end
  end
end
