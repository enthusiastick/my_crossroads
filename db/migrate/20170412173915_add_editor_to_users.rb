class AddEditorToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :editor, :boolean, default: false
  end
end
