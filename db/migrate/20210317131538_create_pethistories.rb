class CreatePethistories < ActiveRecord::Migration[5.2]
  def change
    create_table :pethistories do |t|
      t.date :date
      t.float :weight
      t.string :height
      t.text :description
      t.belongs_to :pet, foreign_key: true

      t.timestamps
    end
  end
end
