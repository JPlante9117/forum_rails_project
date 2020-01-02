class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.integer :category_id

      t.timestamps
    end
  end
end
