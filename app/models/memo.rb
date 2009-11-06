class Memo < ActiveRecord::Base
validates_presence_of :name, :p_next, :t_next,:m, :n
validates_numericality_of :p_next, :t_next,:m, :n

validates_length_of :name, :maximum => 64
validates_uniqueness_of :name, :on => :create, :message => "不能与现有项重复"

end
