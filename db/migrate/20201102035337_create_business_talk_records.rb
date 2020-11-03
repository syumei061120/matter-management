class CreateBusinessTalkRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :business_talk_records do |t|
      t.references :user,            foreign_key: true
      t.references :matter,          foreign_key: true
      t.datetime   :start_time,      null: false
      t.datetime   :end_time,        null: false
      t.text       :explain,         null: false
      t.timestamps
    end
  end
end
