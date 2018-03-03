class CreateJoinTableIngredientRecipt < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ingredients, :recipts do |t|
      t.index [:ingredient_id, :recipt_id]
    end
  end
end
