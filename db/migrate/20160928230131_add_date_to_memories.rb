class AddDateToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :date, :string
  end
end
