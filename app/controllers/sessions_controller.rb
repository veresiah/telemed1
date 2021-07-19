class SessionsController < ApplicationController
  skip_before_action :require_login, except: :destroy
  def new
  end

  def create 
    patient = Patient.find_by(id: params[:id])
    if patient && patient.aunthenticate(params[:password])
      session[:user_id] = patient.id
      redirect_to patient_path(patient)
      flash[:success] = "Login was Successful!"
    else 
      flash[:error] = "Invalid Credentials, try again"      
      render 'new'
    end 
  end 

  def omniauth
    patient = Patient.from_omniauth(request.env['omniauth.auth'])
    patient.valid? 
    session[:user_id] = patient.id
    redirect_to patient_path(patient)
    flash[:success] = "Login was successful" 
end 

  def destroy  
    session.delete :user_id 
    redirect_to login_path
    flash[:notice] = "Logged out Successfully!"
  end 
end
