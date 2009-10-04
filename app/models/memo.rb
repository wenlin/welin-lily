class Memo < ActiveRecord::Base
validates_presence_of :name, :p_next, :t_next,:m, :n
validates_numericality_of :p_next, :t_next,:m, :n

validates_presence_of :t_first, :on => :update
validates_numericality_of :t_first, :on => :update

validates_length_of :name, :maximum => 10
validates_uniqueness_of :name, :on => :create, :message => "不能与现有项重复"

end
