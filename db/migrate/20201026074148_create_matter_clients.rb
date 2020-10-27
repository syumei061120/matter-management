class CreateMatterClients < ActiveRecord::Migration[6.0]
  def change
    create_table :matter_clients do |t|
      t.references :matter, foreign_key: true
      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
