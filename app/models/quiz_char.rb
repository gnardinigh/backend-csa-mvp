class QuizChar < ApplicationRecord
  belongs_to :quiz
  belongs_to :character
end
