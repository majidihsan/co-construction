class Company < ActiveRecord::Base
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

  validates :name,          presence: true
  validates :category,      presence: true
  validates :address,       presence: true
  validates :zipcode,       presence: true, numericality: true
  validates :phone,         presence: true, numericality: true
  validates :working_since, presence: true, numericality: true
  validates :working_hours, presence: true

  belongs_to :user
  has_many :interested_companies, dependent: :destroy
  has_many :projects, through: :interested_companies


  def owner?(user)
    if self.user == user
      true
    else
      false
    end
  end
end
