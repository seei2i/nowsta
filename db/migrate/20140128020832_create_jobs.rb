class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :people
      t.belongs_to :event
      t.string :status
      t.datetime :appointment_date

      t.timestamps
    end
  end
end
