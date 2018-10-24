class CreateQuizChars < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_chars do |t|
      t.references :quiz, foreign_key: true
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
