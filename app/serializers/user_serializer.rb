class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number
  has_one :active_resume

  def attributes(*args)
    result = super
    result[:token] = instance_options[:token] if instance_options[:token]
    result
  end
end
