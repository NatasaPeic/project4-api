class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :name
      t.string :description
      t.string :cohort

      t.timestamps null: false
    end
  end
end
