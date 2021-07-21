class AppointmentsController < ApplicationController
  before_action :set_physician, except: [:show, :destroy]
  before_action :set_appointment, only: [:show, :destroy]
  def index
    @appointments = @physician.appointments.all.date
  end

  def new
    @appointment = @physician.appointments.new
  end

  def create 
    @patient = current_user
    appointment = @physician.appointments.new(appointment_params)
    if appointment.save
      redirect_to appointment_path(appointment)
    else 
      render 'new'
    end 
  end 

  def show
  end

  def destroy 
    if @appointment
      @appointment.destroy
      redirect_to physician_appointments_path(@appointment.physician.id)
    end 
  end 

  private 
  def appointment_params 
    params.require(:appointment).permit(:date, :reason, :patient_id) 
  end 

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end 

  def set_physician
    @physician = Physician.find(params[:physician_id])
  end 
end
