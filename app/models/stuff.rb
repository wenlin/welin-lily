class Stuff < ActiveRecord::Base
validates_presence_of :subject_id, :day_id, :sn, :name, :status
validates_length_of :name, :maximum => 10
validates_uniqueness_of :name, :on => :create, :message => "�������������ظ�"
end
