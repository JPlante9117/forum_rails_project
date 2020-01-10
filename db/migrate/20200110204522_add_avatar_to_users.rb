class AddAvatarToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar_url, :text, default: "https://eitrawmaterials.eu/wp-content/uploads/2016/09/empty-avatar.jpg"
  end
end
