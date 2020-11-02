class CreateBusinessTalkRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :business_talk_records do |t|

      t.timestamps
    end
  end
end
