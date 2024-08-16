class AvailabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_engineer
  before_action :set_service_and_week, only: :index

  def index
    @availabilities = current_user.availabilities.where(service: @service, week: @week).includes(:service, :week)
    @days = (@week.start_date..@week.end_date).to_a
    @time_blocks = generate_time_blocks(@service.contract_start_time, @service.contract_end_time)
  end

  def edit_multiple
    @service = Service.find(params[:service_id])
    @week = Week.find(params[:week_id])
    @shifts = Shift.where(service: @service, week: @week)
    @availabilities = Availability.where(user: current_user, service: @service, week: @week)
  end

  def update_multiple
    @service = Service.find(params[:service_id])
    @week = Week.find(params[:week_id])

    params[:availabilities]&.each do |shift_id, selected|
      shift = Shift.find(shift_id)

      if selected == "1"
        Availability.find_or_create_by!(
          user: current_user,
          service: @service,
          week: @week,
          start_time: shift.start_time,
          end_time: shift.end_time
        )

        shift.update!(status: 'Asignado', user: current_user)
      else
        availability = Availability.find_by(
          user: current_user,
          service: @service,
          week: @week,
          start_time: shift.start_time,
          end_time: shift.end_time
        )

        if availability
          availability.destroy
          shift.update!(status: 'sin asignar', user: nil)
        end
      end
    end

    redirect_to shifts_path, notice: 'Disponibilidad actualizada correctamente.'
  end


  private

  def set_service_and_week
    @service = Service.find(params[:service_id])
    @week = Week.find(params[:week_id])
  end

  def generate_time_blocks(start_time, end_time)
    (start_time.to_i...end_time.to_i).step(1.hour).map { |time| Time.at(time).strftime("%H:%M") }
  end

  def authorize_engineer
    redirect_to root_path, alert: 'No autorizado.' unless current_user.ingeniero?
  end

  def availability_params
    params.require(:availability).permit(:start_time, :end_time, :available)
  end
end
