class Api::V1::CharactersController < ApplicationController
  def index
    @characters = Character.all
    render json: @characters
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      render json: @character, status: :accepted
    else
      @existing_char = Character.all.find { |char| char.simplified == @character.simplified }
      render json: @existing_char, status: :accepted
    end
  end

  def update
    @character.update(character_params)
    if @character.save
      render json: @character, status: :accepted
    else
      render json: { errors: @character.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def character_params
    params.permit(:pinyin, :simplified, :definition)
  end

  def find_character
    @character = Character.find(params[:id])
  end
end
