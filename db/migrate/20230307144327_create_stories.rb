class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :story
      t.integer :owner_id
      t.text :description
      t.integer :boomarks_count

      t.timestamps
    end
  end
end
