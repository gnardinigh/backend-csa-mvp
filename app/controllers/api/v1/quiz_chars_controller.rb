class Api::V1::QuizCharsController < ApplicationController
  def index
    @quiz_chars = QuizChar.all
    render json: @quiz_chars
  end

  def create
    @quiz_char = QuizChar.new(quiz_char_params)
    if @quiz_char.save
      render json: @quiz_char, status: :accepted
    else
      render json: { errors: @quiz_char.errors.full_messages }, status: :unprocessible_entity 
    end
  end

  def update
    @quiz_char.update(quiz_char_params)
    if @quiz_char.save
      render json: @quiz_char, status: :accepted
    else
      render json: { errors: @quiz_char.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @quiz_char = find_quiz_char
    @quiz_char.destroy
    render json: @quiz_char, status: :accepted
  end

  private

  def quiz_char_params
    params.permit(:quiz_id, :character_id)
  end

  def find_quiz_char
    @quiz_char = QuizChar.find(params[:id])
  end
end
