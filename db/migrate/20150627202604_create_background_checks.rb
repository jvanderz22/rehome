class CreateBackgroundChecks < ActiveRecord::Migration
  def change
    create_table :background_checks do |t|
      t.references :applicant
      t.text :text
      t.text :notes

      t.timestamps null: false
    end
  end
end
