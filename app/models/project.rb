class Project < ActiveRecord::Base
  CATEGORIES = [
  'Insulation and Acountical',
  'Framing',
  'Mill Work',
  'Concrete',
  'Dry Wall',
  'Electrical',
  'Flooring',
  'Fire Protection',
  'Glazing Work',
  'Landscaping',
  'Lock and Security',
  'Plumbing',
  'Structural Steel',
  'Ceramic and Tile'].freeze

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :duration, presence: true
  validates :address, presence: true
  validates :zipcode, presence: true, numericality: true

  belongs_to :user

  def owner?(user)
    if self.user == user
      true
    else
      false
    end
  end
end
