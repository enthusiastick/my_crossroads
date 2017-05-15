class InventorySerializer < ActiveModel::Serializer
  attributes :id, :quantity, :component_name

  def component_name
    object.ingredient.name
  end
end
