class RepresenterFactory
  def self.call(resource, options = {})
    new(resource, options).representer
  end

  def initialize(resource, options = {})
    @resource = resource
  end

  def representer_class
    @representer_class ||= Object.const_get("#{resource_class_name}Representer")
  end

  def representer
    if has_errors?
      ValidationErrorRepresenter.for_collection.prepare(resource_errors)
    elsif collection_resource?
      representer_class.for_collection.prepare(@resource)
    else
      representer_class.prepare(@resource)
    end
  end

  private

  def has_errors?
    @resource.respond_to?(:errors) && !@resource.errors.empty?
  end

  def resource_class_name
    if collection_resource?
      @resource.klass.name
    else
      @resource.class.name
    end
  end

  def collection_resource?
    @resource.kind_of?(ActiveRecord::Relation)
  end

  def resource_errors
    resource_name = resource_class_name.underscore
    root = "/#{resource_name.pluralize}"

    @resource.errors.map do |attribute, message|
      if attribute.to_s == resource_name
        attribute = 'id'
      end

      { path: "#{root}/#{attribute}", code: message }
    end
  end
end
