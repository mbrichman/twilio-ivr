class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :service_date
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
