class Api::AdoptionApplicationsController < ApiController
  include RepresentsJsonApiResources

  def index
    adoption_applications = AdoptionApplication.all
    represent adoption_applications
  end
end
