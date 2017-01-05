class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :destroy]
  before_action :set_patients_and_physicians, only: [:new, :create, :edit]

  def new
    @appointment = Appointment.new
  end

  def create
    #TODO: Check Values

    @patient = Patient.find(params[:appointment][:patient])
    @physician = Physician.find(params[:appointment][:physician])
    @appointment = @patient.appointments.create(physician_id: params[:appointment][:physician],appointment_date: params[:appointment][:appointment_date])
    if @appointment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    #TODO: change @edit_appointment
    if @appointment.update_attributes(appointment_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
    @todays_appointments = Appointment.all.select{|appointment| (appointment.appointment_date.to_date == Date.today)}
  end

  def destroy
    if @appointment.destroy
      redirect_to root_path
    end
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
    params.require(:appointment).permit( :patient_id, :physician_id, :appointment_date)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_patients_and_physicians
    @patients = Patient.all
    @physicians = Physician.all
  end
end
