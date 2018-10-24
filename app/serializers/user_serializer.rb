class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :quizzes, :quiz_results, :char_proficiencies
  
  # def quiz_chars
  #   self.object.quiz_chars.map do |qc|
  #     {
  #       id:qc.id,
  #       quiz_id:qc.quiz_id,
  #       character_id:qc.character_id,
  #       character:qc.character,
  #     }
  #   end
  # end

  def quiz_chars(quiz)
    quiz.quiz_chars.map do |qc|
      qc.character
    end
  end

  def quizzes
    self.object.quizzes.map do |quiz|
    @quiz_chars = quiz_chars(quiz)
      {
        quizId:quiz.id,
        title:quiz.title,
        user_id:quiz.user_id,
        quizChars:@quiz_chars,
      }
    end
  end



  def quiz_results
    self.object.quiz_results.map do |qr|
      {
        quizResultId:qr.id,
        result:qr.pass,
        character:qr.quiz_char.character.simplified,
        pinyin:qr.quiz_char.character.pinyin,
        charId:qr.quiz_char.character.id,
        userId:qr.user_id,
        listId:qr.quiz_id,
      }
    end
  end

  def char_proficiencies
     
     QuizResult.proficiencies
     
  end
  


end
