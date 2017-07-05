class RenameColum < ActiveRecord::Migration[5.0]
  def change
    change_table :comments do |t|
      t.rename :titel, :title
      
  end
end
