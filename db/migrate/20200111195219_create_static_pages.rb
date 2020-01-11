class CreateStaticPages < ActiveRecord::Migration[6.0]
  def change
    create_table :static_pages do |t|
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
