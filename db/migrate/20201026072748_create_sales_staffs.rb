class CreateSalesStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_staffs do |t|

      t.timestamps
    end
  end
end
