class AddLockedToBoardThreads < ActiveRecord::Migration[6.0]
  def change
    add_column :board_threads, :locked, :boolean, default: false
  end
end
