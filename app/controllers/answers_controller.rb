class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer, only: [:edit, :update, :destroy]
  
  def show
    
  end

  def new
    @answer = current_user.answers.build
  end

  def create
    @answer = current_user.answers.build(answer_params)
    @answer.start_time = params[:answer][:start_time].to_datetime
    @answer.end_time = (@answer.start_time).to_time
    if @answer.save
      debugger
      redirect_to root_path
    else
      flash[:error] = @answer.errors.full_messages[0]
      render :new
    end
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to root_path
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:description, :user_id, :start_time, :answer_date)
  end
end