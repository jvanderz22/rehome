class AdoptionApplication < ActiveRecord::Base
  has_many :adoption_applications_user
  has_many :applicants, through: :adoption_applications_user, source: :user
end
