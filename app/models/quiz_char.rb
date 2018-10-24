class QuizChar < ApplicationRecord
  belongs_to :quiz
  belongs_to :character
  has_many :quiz_results
end
