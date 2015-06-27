class AdoptionApplicationsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :adoption_application
end
