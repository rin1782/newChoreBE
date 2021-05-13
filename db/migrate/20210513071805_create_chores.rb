class CreateChores < ActiveRecord::Migration[6.1]
  def change
    create_table :chores do |t|
      t.references :kid, null: false, foreign_key: true
      t.string :chore

      t.timestamps
    end
  end
end
