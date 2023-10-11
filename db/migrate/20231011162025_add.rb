class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :shoes, :order, :int
  end
end
