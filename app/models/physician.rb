class Physician < ActiveRecord::Base
  has_many :appointments
  has_many :patients, :through => :appointments

  validates :name, :specialization, :presence => :true
end
