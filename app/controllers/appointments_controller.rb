class AppointmentsController < ApplicationController
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
end
