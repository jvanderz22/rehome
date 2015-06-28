require 'json_api_representer'
require 'roar/decorator'
require 'roar/coercion'

class AdoptionApplicationRepresenter < Roar::Decorator
  include JsonApiRepresenter
  include Roar::Coercion

  type 'adoption_application'
  alias_method :adoption_application, :represented

  property :id, type: String
  property :owner_id
  property :charity
  property :rehoming_fee
  property :pet_name

end
