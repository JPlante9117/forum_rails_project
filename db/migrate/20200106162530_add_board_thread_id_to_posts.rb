class AddBoardThreadIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :board_thread_id, :integer
  end
end
