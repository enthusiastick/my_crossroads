module InventoryHelper
  def button_to_add_inventory(f)
    new_inventory = f.object.send(:inventories).klass.new
    id = new_inventory.object_id
    fields = f.fields_for(:inventories, new_inventory, child_index: id) do |builder|
      render partial: "ingredients_fields", locals: {form: builder}
    end
    link_to("Add Component", "", class: "add_fields button", id: "add-component-button", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
