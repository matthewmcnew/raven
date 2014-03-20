class CreateZaps < ActiveRecord::Migration
  def change
    create_table :zaps do |t|
      t.string :assignment
      t.references :student, index: true

      t.timestamps
    end
  end
end
