class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.text :introduction
      t.text :image
      t.date :birthday

      t.timestamps
    end
  end
end
