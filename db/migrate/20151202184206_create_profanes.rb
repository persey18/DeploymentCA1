class CreateProfanes < ActiveRecord::Migration
  def change
    create_table :profanes do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
