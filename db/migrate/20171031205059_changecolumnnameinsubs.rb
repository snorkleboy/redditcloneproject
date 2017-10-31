class Changecolumnnameinsubs < ActiveRecord::Migration[5.1]
  def change
    rename_column :subs, :moderator, :moderator_id 
  end
end
