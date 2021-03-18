class ChangeHeightToFloatInPethistories < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :pethistories do |t|
        dir.up {t.change :height, :float}
        dir.down {t.change :height, :string}
      end
    end
  end
end
