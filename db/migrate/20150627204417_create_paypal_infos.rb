class CreatePaypalInfos < ActiveRecord::Migration
  def change
    create_table :paypal_infos do |t|
      t.references :user, index: true, foreign_key: true
      t.string :email

      t.timestamps null: false
    end
  end
end
