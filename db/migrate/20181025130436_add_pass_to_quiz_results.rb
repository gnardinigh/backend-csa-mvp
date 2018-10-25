class AddPassToQuizResults < ActiveRecord::Migration[5.2]
  def change
    add_column :quiz_results, :pass, :boolean
  end
end
