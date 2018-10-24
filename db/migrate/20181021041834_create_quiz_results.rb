class CreateQuizResults < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_results do |t|
      t.references :quiz_char, foreign_key: true
      t.boolean :pass

      t.timestamps
    end
  end
end
