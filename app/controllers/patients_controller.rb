class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)
    if @patient.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :mobile_no)
  end
end
