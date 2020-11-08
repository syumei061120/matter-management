class CreateMatters < ActiveRecord::Migration[6.0]
  def change
    create_table :matters do |t|
      t.references :user,            foreign_key: true
      t.references :sales_staff,     foreign_key: true
      t.string     :matter_name,     null: false
      t.text       :matter_explain
      t.string     :product,         null: false
      t.integer    :sale_price
      t.integer    :profit_price
      t.date       :sale_time
      t.integer    :priority_id,     null: false
      t.integer    :reliability_id,  null: false
      t.integer    :progress_id,     null: false
      t.string     :occasion,        null: false
      t.datetime   :updated_daytime, null: false
      t.timestamps
    end
  end
end
