class Appointment < ActiveRecord::Base
  belongs_to :physician
  belongs_to :patient

  validates :patient_id, :physician_id, :appointment_date, :presence => :true
end
