class AddBodyToList < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :body, :string
  end
end
