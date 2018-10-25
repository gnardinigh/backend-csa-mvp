class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :quizzes, :quiz_chars, :quiz_results, :char_proficiencies
  
  
  
  def quiz_results
    self.object.quiz_results.map do |qr|
      {
        id:qr.id,
        character_id:qr.character_id,
        user_id:qr.user_id,
        pass:qr.pass,
      }
    end
  end

  def quizzes
    self.object.quizzes.map do |quiz|
      qcs = quiz.quiz_chars.map do |c|
          {
            id:c.id,
            quizId:c.quiz_id,
            characterId:c.character_id,
            pinyin:c.character.pinyin,
            simplified:c.character.simplified
          }
      end
      {
        quizId:quiz.id,
        title:quiz.title,
        user_id:quiz.user_id,
        quizChars:qcs
      }
    end
  end

  def char_proficiencies
     
     QuizResult.proficiencies
     
  end
  


end
