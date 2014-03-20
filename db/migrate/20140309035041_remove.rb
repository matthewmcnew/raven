class Remove < ActiveRecord::Migration
  def change
    remove_column :zaps, :assignment
  end
end
