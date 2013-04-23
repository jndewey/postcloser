class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :author
      t.string :name
      t.boolean :status
      t.date :deadline

      t.timestamps
    end
  end
end
