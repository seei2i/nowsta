class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :date
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end
