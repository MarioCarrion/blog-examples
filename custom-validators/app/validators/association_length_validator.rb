class AssociationLengthValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    elements = record.send(attribute)
    return unless elements

    minimum = maximum = nil

    if options[:minimum]
      minimum = options[:minimum].to_i
      raise ArgumentError, ':minimum must be a positive number' if minimum <= 0
    end

    if options[:maximum]
      maximum = options[:maximum].to_i
      raise ArgumentError, ':maximum must be a positive number' if maximum <= 0
    end

    length = elements.reject(&:marked_for_destruction?).length

    if minimum && length < minimum
      record.errors.add(attribute, :'association_length/minimum', minimum: minimum)
    end

    if maximum && length > maximum
      record.errors.add(attribute, :'association_length/maximum', maximum: maximum)
    end
  end
end
