class ShiftsController < ApplicationController
  def index
    @services = Service.all
    @weeks = Week.all

    if params[:service_id].present? && params[:week_id].present?
      @service = Service.find_by(id: params[:service_id])
      @week = Week.find_by(id: params[:week_id])

      if @service && @week
        @shifts = Shift.where(service: @service, week: @week)
        create_shifts_for_service_and_week(@service, @week) if @shifts.blank?
      else
        flash.now[:alert] = "Servicio o semana no encontrados."
      end
    else
      @shifts = []
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def create_shifts_for_service_and_week(service, week)
    week.days.each do |day|
      generate_contract_hours(service).each do |hour|
        Shift.find_or_create_by!(
          service: service,
          week: week,
          day: day.strftime('%A'),
          start_time: hour,
          end_time: hour + 1.hour
        ) do |shift|
          shift.status = "sin asignar"
        end
      end
    end
  end

  def generate_contract_hours(service)
    start_time = service.contract_start_time
    end_time = service.contract_end_time
    (start_time.to_i...end_time.to_i).step(1.hour).map { |t| Time.at(t).utc }
  end
end
