class AppointmentsController < ApplicationController
  def new
    @patients = Patient.all
    @physicians = Physician.all
  end

  def create
    @patient = Patient.find(params[:patient])
    @physician = Physician.find(params[:physician])
    @appointment = @patient.appointments.create(physician_id: @physician.id,appointment_date: params[:appointment_date])
    if @appointment.save
      redirect_to root_path
    else
      @patients = Patient.all
      @physicians = Physician.all
      render 'new'
    end
  end

  def edit
    @patients = Patient.all
    @physicians = Physician.all
    @edit_appointment = Appointment.find(params[:format])
  end

  def update
    @edit_appointment = Appointment.find(params[:format])
    @appointment = @edit_appointment.update_attributes(appointment_params)
    if @appointment.save
      redirect_to root_path
    end
  end

  def show
    @todays_appointments = Appointment.all.select{|appointment| (appointment.appointment_date.to_date == Date.today)}
  end

  def destroy
  end

  def index
    @appointments = Appointment.all.order(appointment_date: :asc)
  end

  def patient
    if params[:search_term]
      @patient_appointments = Patient.find(params[:search_term]).appointments
    end
  end

  def physician
    if params[:search_term]
      @physician_appointments = Physician.find(params[:search_term]).appointments
    end
  end

  private
  def appointment_params
    params.permit(:patient_id, :physician_id, :appointment_date)
  end
end
