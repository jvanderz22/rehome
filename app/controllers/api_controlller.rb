class V3::ApiController < ApplicationController
  include RepresentsJsonApiResources

  before_action :require_json

  rescue_from ActiveRecord::RecordNotFound do
    head 404
  end

  rescue_from ActionController::ParameterMissing do |ex|
    render_errors([{
      status: 400,
      code: 'parameter_required',
      path: "/#{ex.param}"
    }])
  end

  protected

  def render_errors(errors, status = :bad_request)
    render json: { errors: errors },
      content_type: 'application/vnd.api+json',
      status: status
  end

  private

  def require_json
    unless request.format.json? || request.format.json_api?
      head :not_acceptable
      false
    end
  end
end
