class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.belongs_to :company, null: false
      t.belongs_to :project, null: false
      t.string :body, null: false
    end
  end
end
