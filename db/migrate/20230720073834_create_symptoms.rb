class CreateSymptoms < ActiveRecord::Migration[6.1]
  def change
    create_table :symptoms do |t|
      t.integer :category
      t.string :detail

      t.timestamps
    end
  end
end
