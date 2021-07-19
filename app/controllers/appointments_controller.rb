class AppointmentsController < ApplicationController
  before_action :set_physician
  before_action :set_appointment, only: [:show, :destroy]
  def index
    @appointments = @physician.appointments.all #add scope method here?
  end

  def new
    @appointment = @physician.appointments.new 
  end

  def create 
    appointment = @physician.appointments.build(appointment_params)
    if appointment.save
      redirect_to appointment_path(appointment)
    else 
      render 'new'
    end 
  end 

  def show
  end

  def destroy 
    @appointment.destory
    redirect_to physician_appointments_path
  end 

  private 
  def appointment_params 
    params.require(:appointment).permit(:date, :reason) 
  end 

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end 

  def set_physician
    @physician = Physician.find(params[:physician_id])
  end 
end
