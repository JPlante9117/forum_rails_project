class CreateBoardThreads < ActiveRecord::Migration[6.0]
  def change
    create_table :board_threads do |t|
      t.string :title
      t.integer :board_id

      t.timestamps
    end
  end
end
