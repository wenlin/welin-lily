class TurnIntToDecimal < ActiveRecord::Migration
  def self.up
    change_column(:memos, :t_next, :decimal, :precision => 3, :scale => 1)
  end

  def self.down
    change_column(:memos, :t_next, :integer)
  end
end
