class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  validates :body, presence: true
  validates :rating, inclusion: {in: [1, 2, 3, 4, 5]}
  validates :user_id, presence: true
  validates :company_id, presence: true

  def review_owner?(user)
    if self.user == user
      true
    else
      false
    end
  end
end
