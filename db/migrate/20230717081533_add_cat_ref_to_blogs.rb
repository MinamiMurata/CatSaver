class AddCatRefToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_reference :blogs, :cat, foreign_key: true
  end
end
