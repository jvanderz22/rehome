class CreateJoinTableAdoptionApplicationUser < ActiveRecord::Migration
  def change
    create_join_table :adoption_applications, :users do |t|
      # t.index [:adoption_application_id, :user_id]
      # t.index [:user_id, :adoption_application_id]
    end
  end
end
