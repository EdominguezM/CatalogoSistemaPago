class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :category, polymorphic: true

      t.timestamps
    end
  end
end
