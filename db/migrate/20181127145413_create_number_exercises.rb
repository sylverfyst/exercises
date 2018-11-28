class CreateNumberExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :number_exercises do |t|

      t.timestamps
    end
  end
end
