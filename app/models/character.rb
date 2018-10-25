class Character < ApplicationRecord
    has_many :quiz_chars
    has_many :quizzes, through: :quiz_chars
    has_many :quiz_results
    

    validates :simplified, uniqueness: { scope: :pinyin,
    message: "already have this char saved" }
    
end
