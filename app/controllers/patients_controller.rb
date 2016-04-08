class PatientsController < ApplicationController
  def new
  end

  def create
    @patient = Patient.create(patient_params)
    if @patient.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def patient_params
    params.permit(:name, :mobile_no)
  end
end
