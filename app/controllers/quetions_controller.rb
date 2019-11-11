class QuetionsController < ApplicationController
  before_action :load_quetion, only: [:show,:edit]

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

  private
  def load_quetion
    @quetion=Quetion.find(params[:id])
  end

end
