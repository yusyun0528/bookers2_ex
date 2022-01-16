class CreateDirectMassages < ActiveRecord::Migration[5.2]
  def change
    create_table :direct_massages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.text :body

      t.timestamps
    end
  end
end
