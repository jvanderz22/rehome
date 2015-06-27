class AdoptionApplicationController < ApplicationController
  def index
    @applications = [
      { pet_name: 'Buster',
        owner_id: 1,
        rehoming_fee: 100.00,
        background_check_required: true,
        owner_accepted: false,
        charity: 'Hyde Park Cats',
        applicant_id: nil },
      { pet_name: 'Buddy',
        owner_id: 2,
        rehoming_fee: 200.00,
        background_check_required: false,
        owner_accepted: true,
        charity: 'Animal Welfare League',
        applicant_id: nil
      }]
    render json: @applications
  end
end
