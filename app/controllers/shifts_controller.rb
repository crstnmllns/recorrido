class ShiftsController < ApplicationController
  def assign
    service = Service.find(params[:service_id])
    week = Week.find(params[:week_id])
    
    ShiftAssignmentService.new(service, week).assign_shifts
    
    redirect_to shifts_path, notice: 'Turnos asignados exitosamente.'
  end
end
