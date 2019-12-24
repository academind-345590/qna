class AnswersController < ApplicationController
  def create
    @quetion = Quetion.find(params[:quetion_id])
    @answer = @quetion.answers.build(answer_params)
    #redirect_to quetion_path(@quetion)
    respond_to do |format|
      if @answer.save
        format.html {render partial: 'quetions/answers', layout: false}
        format.json {render json: @answer }
        #format.js
      else
        format.html { render text: @answer.errors.full_massages.join("\n"), status: :umprocessable_entity }
        format.json { render json: @answer.errors.full_massages, status: :umprocessable_entity }
      end
    end
  end

  def update
    @answer=Answer.find(params[:id])
    @answer.update(answer_params)
    @quetion=@answer.quetion
    redirect_to quetion_path(@quetion)  
  end

  private

  def answer_params
    params.require(:answer).permit(:body, attachments_attributes: [:file] )
  end
end
