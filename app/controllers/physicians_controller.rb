class PhysiciansController < ApplicationController
  before_action :set_physician, except: [:new, :create, :index]
  def index
    @physicians = Physician.all
  end
  def new
    @physician = Physician.new 
  end

  def create 
    physician = Physician.new(physician_params)
    if physician.save
      redirect_to physician_path(physician)
    else 
      render 'new'
    end 
  end 

  def edit
  end

  def show
  end

  def update 
    if @physician.update(physician_params)
        redirect_to physician_path(@physician)
    else 
        render 'edit'
    end 
  end 

  def destroy 
    @physician.destory 
    redirect_to physicians_path
  end

  private 
    
    def physician_params
        params.require(:physician).permit(:name, :speciality, :hospital, :education, :years_in_practice)
    end 

    def set_physician
      @physician = Physician.find(params[:id])
    end 
end
