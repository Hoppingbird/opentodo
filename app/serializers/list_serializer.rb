class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :user

   def user
      [object.user.name, object.user.id]
   end

  def items
      [object.items.name, object.item.list_id]
  end
end
