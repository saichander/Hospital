class CreatePhysicians < ActiveRecord::Migration
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :specialization

      t.timestamps null: false
    end
  end
end
