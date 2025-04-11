# frozen_string_literal: true

module ApiResponder
  extend ActiveSupport::Concern

  def render_success(options = {}, status: :ok)
    data = options[:data] || []
    message = options[:message] || 'success'
    meta = options[:meta] || {}
    instance_options = options[:instance_options] || {}

    # Automatically infer serializer if not explicitly provided
    serializer_class = options[:serializer]

    if serializer_class.nil? && data.present?
      klass = data.respond_to?(:to_ary) ? data.first.class : data.class
      serializer_class = "#{klass}Serializer".safe_constantize
    end

    serialized_data =
      if serializer_class
        if data.respond_to?(:to_ary)
          ActiveModel::Serializer::CollectionSerializer.new(data, serializer: serializer_class, instance_options: instance_options)
        else
          serializer_class.new(data, instance_options)
        end
      else
        data
      end

    render json: {
      success: true,
      data: serialized_data,
      meta: meta.merge(message: message, timestamp: Time.current)
    }, status: status
  end


  def render_error(options = {}, status: :unprocessable_entity)
    errors = options[:errors] || options[:error] || []
    message = options[:message] || 'error'
    meta = options[:meta] || {}

    formatted_errors = errors.is_a?(Array) ? errors : [errors]

    render json: {
      success: false,
      errors: formatted_errors,
      meta: meta.merge(message: message, timestamp: Time.current)
    }, status: status
  end
end
