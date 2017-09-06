class ChangeDateFormatForEvents < ActiveRecord::Migration[5.1]
  def up
    change_column :events, :date, :date
  end
  def down
    change_column :events, :date, :datetime
  end
end
