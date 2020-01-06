class RemoveThreadIdFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :thread_id, :integer
  end
end
