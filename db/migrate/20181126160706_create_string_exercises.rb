class CreateStringExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :string_exercises do |t|

      t.timestamps
    end
  end
end
