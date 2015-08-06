class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at

  def id
    object.id
  end

  def name
    object.name
  end

  def password
    object.created_at.strftime('%d / %m / %y')
  end
end
