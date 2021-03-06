class PhysiciansController < ApplicationController
  def new
  end

  def create
    @physician = Physician.create(physician_params)
    if @physician.save
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
  def physician_params
    params.permit(:name, :specialization)
  end
end
