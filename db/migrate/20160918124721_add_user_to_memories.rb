class AddUserToMemories < ActiveRecord::Migration
  def change
    add_reference :memories, :user, index: true, foreign_key: true
  end
end
