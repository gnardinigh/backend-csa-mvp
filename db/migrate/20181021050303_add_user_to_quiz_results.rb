class AddUserToQuizResults < ActiveRecord::Migration[5.2]
  def change
    add_reference :quiz_results, :user, foreign_key: true
  end
end
