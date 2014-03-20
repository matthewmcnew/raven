class AddAssignmentIdToZaps < ActiveRecord::Migration
  def change
    add_column :zaps, :assignment_id, :integer
  end
end
