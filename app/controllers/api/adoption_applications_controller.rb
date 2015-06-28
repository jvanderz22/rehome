class Api::AdoptionApplicationsController < ApiController
  include RepresentsJsonApiResources

  def index
    adoption_applications = AdoptionApplication.all
    represent adoption_applications
  end

  def show
    adoption_application = AdoptionApplication.find(params[:id])
    represent adoption_application
  end

  def create
    adoption_application = AdoptionApplication.create(adoption_application_params)
    represent adoption_application, status: :created
  end

  private

  def adoption_application_params
    {
      charity: params.require(:charity),
      rehoming_fee: params.require(:rehoming_fee),
      pet_name: params.require(:pet_name),
      owner_id: owner.id
    }
  end

  def owner
    @owner ||= User.find(params.require(:owner_id))
    render_errors([{ status: '404', code: 'owner_not_found' }]) if @owner.nil?
    @owner
  end
end
