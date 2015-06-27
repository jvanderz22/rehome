require 'representer_factory'
require 'roar_ext/merge_linked'

module RepresentsJsonApiResources
  def represent(resource, options = {})

    render_options = {
      json: resource.to_hash,
      content_type: 'application/vnd.api+json'
    }

    render(render_options)
  end
end
