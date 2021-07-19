class AppointmentsController < ApplicationController
  before_action :set_appointment, except: [:new, :create]
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new 
  end

  def create 
    appointment = Appointment.new(appointment_params)
    if appointment.save
      redirect_to appointment_path(appointment)
    else 
      render 'new'
    end 
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
