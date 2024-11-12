class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.boolean :anonymous, default: false
      t.references :post, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true  # Usuario puede ser nulo si es anónimo
      t.timestamps
    end
  end
end
