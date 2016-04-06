class AddPhysicianIdToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :physician_id, :integer
  end
end
