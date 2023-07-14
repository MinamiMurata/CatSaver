class AddBreedRefToCats < ActiveRecord::Migration[6.1]
  def change
    add_reference :cats, :breed, null: false, foreign_key: true
  end
end
