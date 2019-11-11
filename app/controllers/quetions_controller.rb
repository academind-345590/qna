class QuetionsController < ApplicationController

  def index
    @quetions=Quetion.all
  end

  def show
    @quetion=Quetion.find(params[:id])
  end

end
