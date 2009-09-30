class Stuff < ActiveRecord::Base
validates_presence_of :subject_id, :day_id, :sn, :name, :status
end
