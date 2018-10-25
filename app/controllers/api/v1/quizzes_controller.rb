class Api::V1::QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
    render json: @quizzes
  end



  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      render json: @quiz, status: :accepted
    else
      render json: { errors: @quiz.errors.full_messages }, status: :unprocessible_entity 
    end
  end

  def show
    @quiz = find_quiz
    if @quiz
      render json: @quiz, status: :accepted
    else
      render json: { errors: @quiz.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @quiz.update(quiz_params)
    if @quiz.save
      render json: @quiz, status: :accepted
    else
      render json: { errors: @quiz.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @quiz=find_quiz
    @quiz.destroy
    render json: @quiz, status: :accepted

  end

  private

  def quiz_params
    params.permit(:user_id,:title)
  end

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end
end
