class QuetionsController < ApplicationController
  before_action :load_quetion, only: [:show,:edit, :update]

  def index
    @quetions=Quetion.all
  end

  def show
    
  end

  def new
    @quetion=Quetion.new
  end

  def edit
    
  end

  def create
    @quetion=Quetion.new(quetion_params)

    if @quetion.save
      redirect_to @quetion
    else
      render :new
    end
  end

  def update
    @quetion.update(quetion_params)
    redirect_to @quetion
  end

  private

  def load_quetion
    @quetion=Quetion.find(params[:id])
  end

  def quetion_params
    params.require(:quetion).permit(:title,:body)
  end

end
