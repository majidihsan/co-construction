class Projects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string        :title,         null: false
      t.text          :description,   null: false
      t.string        :category,      null: false
      t.string        :duration,      null: false
      t.string        :address,       null: false
      t.integer       :zipcode,       null: false
      t.belongs_to    :user,          null: false

      t.timestamps null: false
    end
  end
end
