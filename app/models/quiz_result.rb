class QuizResult < ApplicationRecord
  belongs_to :quiz_char

  def self.proficiencies
    @unique_char_ids = self.all.map {|qr|qr.quiz_char.character.id}.uniq

    @unique_char_stats = @unique_char_ids.map { |id|
      {
        char:'', 
        char_id:id,
        pass:0,
        fail:0,
        attempts:0,
        percent_success:0,
        percent_fail:0,
        last_attempt:0,
        leafSize:0,
      }
    }

    @unique_char_stats.each_with_index {|obj,index|
      QuizResult.all.each {|qr|
        
        if qr.quiz_char.character.id == obj[:char_id]
          obj[:char] = qr.quiz_char.character
          obj[:attempts] += 1
          if qr.pass
            obj[:pass] += 1
          else
            obj[:fail] += 1
          end
        end

        if qr.created_at.to_s[5..6].to_i > obj[:last_attempt]
          obj[:last_attempt] = qr.created_at.to_s[5..6].to_i
        end
      }
    }
   


   @unique_char_stats.each do |obj|
      
      passes = obj[:pass].to_f
      fails = obj[:fail].to_f
      attempts = obj[:attempts].to_f

      success = passes/attempts
      failure = fails/attempts

      obj[:percent_success] = (((success*100).to_s)[0..4]).to_f
      obj[:percent_fail] = (((failure*100).to_s)[0..4]).to_f
    end
   
    @totalTreeSize = 0

    @unique_char_stats.each {|stats|
      @totalTreeSize += stats[:percent_fail]
    }

    @unique_char_stats.each_with_index {|stats,index|
      @unique_char_stats[index.to_i][:leafSize] = (((stats[:percent_fail])/(@totalTreeSize.to_f)*100).to_s[0..2]).to_i
    }
   return @unique_char_stats

  end

end
