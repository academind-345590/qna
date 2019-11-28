class AnswersController < ApplicationController
  def create
    @quetion = Quetion.find(params[:quetion_id])
    @answer = @quetion.answers.create(answer_params)
    redirect_to quetion_path(@quetion)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
