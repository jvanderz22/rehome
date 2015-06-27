class CreateAdoptionApplications < ActiveRecord::Migration
  def change
    create_table :adoption_applications do |t|
      t.string :charity
      t.string :pet_name
      t.money :rehoming_fee
      t.string :sstatus
      t.references :owner

      t.timestamps null: false
    end
  end
end
