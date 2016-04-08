class DashboardsController < ApplicationController
  def home
    @todays_appointments = Appointment.all.select{|appointment| (appointment.appointment_date.to_date == Date.today)}
  end
end
