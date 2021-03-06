class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.string :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
