class CreateSalesStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_staffs do |t|
      t.string :sales_department, null: false 
      t.string :sales_staff,      null: false
      t.timestamps
    end
  end
end
