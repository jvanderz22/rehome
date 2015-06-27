require 'roar/json/json_api'

module JsonApiRepresenter
  def self.included(klass)
    klass.class_eval do
      include Roar::JSON::JSONAPI
    end
  end
end
