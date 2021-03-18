class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone_number
      t.string :e_mail

      t.timestamps
    end
  end
end
