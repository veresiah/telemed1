class PhysiciansController < ApplicationController
  def index
    @physicains = Physician.all
  end
  def new
    @physicain = Physician.new 
  end

  def create 
    physicain = Patient.new(physicain_params)
    if physicain.save
      redirect_to physicain_path(physicain)
    else 
      render 'new'
    end 
  end 

  def edit
  end

  def show
  end

  def update 
    if @physicain.update(physicain_params)
        redirect_to physicain_path(@physicain)
    else 
        render 'edit'
    end 
  end 

  def destroy 
    @physicain.destory 
    redirect_to physicains_path
  end 
end
