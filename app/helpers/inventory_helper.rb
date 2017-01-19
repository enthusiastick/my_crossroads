module InventoryHelper
  def button_to_add_inventory(f)
    new_inventory = f.object.send(:inventories).klass.new
    fields = f.fields_for(:inventories, new_inventory) do |builder|
      render partial: "ingredients_fields", locals: {form: builder}
    end
    link_to("Add Component", "", class: "add_fields button", id: "add-component-button", data: {fields: fields.gsub("\n", "")})
  end
end
