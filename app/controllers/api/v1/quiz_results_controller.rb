class Api::V1::QuizResultsController < ApplicationController
  def index
    @quiz_results = QuizResult.all
    render json: @quiz_results
  end


  def create
    @quiz_result = QuizResult.new(quiz_result_params)
    if @quiz_result.save
      render json: @quiz_result, status: :accepted
    else
      render json: { errors: @quiz_result.errors.full_messages }, status: :unprocessible_entity 
    end
  end

  private

  def quiz_result_params
    params.permit(:character_id,:user_id,:pass)
  end

  def find_quiz_result
    @quiz_result = QuizResult.find(params[:id])
  end
end
