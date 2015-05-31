class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.string :difficulty
      t.string :status
      t.references :project, index: true

      t.timestamps
    end
  end
end
