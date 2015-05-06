class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :gamer

      t.string :name, limit: 30
      t.string :description, limit: 150

      t.timestamps null: false
    end
  end
end
