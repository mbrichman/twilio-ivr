class AddAppointmentTimeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_time, :string
  end
end
