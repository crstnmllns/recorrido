class AvailabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_engineer

  def index
    @availabilities = current_user.availabilities.includes(:service, :week)
  end

  def edit
    @availability = current_user.availabilities.find(params[:id])
  end

  def update
    @availability = current_user.availabilities.find(params[:id])
    if @availability.update(availability_params)
      redirect_to availabilities_path, notice: 'Disponibilidad actualizada exitosamente.'
    else
      render :edit
    end
  end

  private

  def authorize_engineer
    redirect_to root_path, alert: 'No autorizado.' unless current_user.ingeniero?
  end

  def availability_params
    params.require(:availability).permit(:start_time, :end_time, :available)
  end
end
