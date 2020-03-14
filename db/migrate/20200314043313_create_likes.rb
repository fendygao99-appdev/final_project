class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :furniture_id
      t.integer :furniture_watcher_id

      t.timestamps
    end
  end
end
