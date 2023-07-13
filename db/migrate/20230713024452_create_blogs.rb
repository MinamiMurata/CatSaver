class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.text :image
      t.string :disease_name
      t.integer :age_range, default: 0, null: false

      t.timestamps
    end
  end
end
