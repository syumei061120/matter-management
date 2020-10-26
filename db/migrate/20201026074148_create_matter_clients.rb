class CreateMatterClients < ActiveRecord::Migration[6.0]
  def change
    create_table :matter_clients do |t|

      t.timestamps
    end
  end
end
