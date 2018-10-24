class User < ApplicationRecord
    has_many :quizzes
    has_many :quiz_results
    has_many :quiz_chars, through: :quizzes
end
