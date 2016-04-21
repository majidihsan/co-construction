class InterestedCompanies < ActiveRecord::Migration
  def change
    create_table :interested_companies do |t|
      t.belongs_to :company, null: false
      t.belongs_to :project, null: false

      t.timestamps null: false
    end
  end
end
