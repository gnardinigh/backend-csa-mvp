class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :pinyin
      t.string :simplified
      t.string :definition

      t.timestamps
    end
  end
end
