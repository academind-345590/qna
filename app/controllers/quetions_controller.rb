class QuetionsController < ApplicationController
  before_action :load_quetion, only: [:show,:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @quetions=Quetion.all
  end

  def show
    @answer = @quetion.answers.build
  end

  def new
    @quetion=Quetion.new
    @quetion.attachments.build
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
    if @quetion.update(quetion_params)
      redirect_to @quetion
    else
      render :edit
    end
  end

  def destroy
    @quetion.destroy
    redirect_to quetions_path
  end

  private

  def load_quetion
    @quetion=Quetion.find(params[:id])
  end

  def quetion_params
    params.require(:quetion).permit(:title,:body, attachments_attributes: [:file] )
  end

end
