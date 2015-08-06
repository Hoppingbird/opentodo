class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :list, :user

  def list
    [object.list.title, object.list.id]
  end

  def user
    [object.list.user.id, object.list.user.name]
  end
end
