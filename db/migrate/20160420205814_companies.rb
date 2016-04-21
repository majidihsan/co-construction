class Companies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string        :name,          null: false
      t.string        :category,      null: false
      t.string        :address,       null: false
      t.integer       :zipcode,       null: false, limit: 8
      t.integer       :phone,         null: false, limit: 8
      t.string        :working_hours, null: false
      t.integer       :working_since, null: false

      t.belongs_to    :user,          null: false

      t.timestamps null: false
    end
  end
end
