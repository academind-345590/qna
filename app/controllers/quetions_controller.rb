class QuetionsController < ApplicationController

  def index
    @quetions=Quetion.all
  end

end
