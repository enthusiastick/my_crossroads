class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.text :description, null: false
      t.belongs_to :contributor
      t.belongs_to :recipient
      t.belongs_to :user

      t.timestamps
    end
  end
end
