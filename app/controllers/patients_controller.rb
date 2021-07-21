class PatientsController < ApplicationController
  before_action :set_patient, except: [:new, :create]
  skip_before_action :require_login, only: [:new]
  def new
    @patient =Patient.new
  end
  
  def create 
    patient = Patient.new(patient_params)
    if patient.save
      redirect_to patient_path(patient)
    else 
      render 'new'
    end 
  end 

  def edit
  end

  def show
  end

  def update 
    if @patient.update(patient_params)
        redirect_to patient_path(@patient)
    else 
        render 'edit'
    end 
  end 

  def destroy 
    @patient.destory 
    redirect_to root_path
  end 

  private 
    
    def patient_params
        params.require(:patient).permit(:uid, :provider, :name, :password, :email, :age, :gender, :medical_conditions, :primary_care, :insurance)
    end 

    def set_patient
      @patient = Patient.find(params[:id])
    end 
end
