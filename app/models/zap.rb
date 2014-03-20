class Zap < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment
  validates_presence_of :assignment
  validates_presence_of :student
end
