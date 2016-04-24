class Proposal < ActiveRecord::Base
  belongs_to :company
  belongs_to :project

  validates :body, presence: true
end
