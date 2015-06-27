require 'representer_factory'

module RepresentsJsonApiResources
  def represent(resource, options = {})
    representer = RepresenterFactory.call(resource, options)

    render_options = {
      json: representer.to_hash,
      content_type: 'application/vnd.api+json'
    }

    render(render_options)
  end
end
