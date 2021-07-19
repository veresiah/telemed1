class AppointmentsController < ApplicationController
  before_action :set_appointment, except: [:new, :create]
  def new
    @appointment = Appointment.new 
  end

  def index
    @appointments = Appointment.all
  end

  def edit
  end

  def show
  end

  def update 
  end 

  def destroy 
    @appointment.destory
    redirect_to appointments_path
  end 

  private 
  def appointment_params 
    params.require(:appointment).permit(:date, :reason) 
  end 

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end 

end
