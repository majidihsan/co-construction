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
  has_one :proposal, dependent: :destroy
  has_many :reviews, dependent: :destroy


  include PgSearch
  pg_search_scope :search_by_attributes, against: [
    :name,
    :category,
    :address,
    :zipcode,
    :phone,
    :working_since,
    :working_hours
  ], using: { tsearch: { prefix: true, dictionary: "english" } }
  scope :search, -> (query) { search_by_attributes (query) if query.present? }

  def owner?(user)
    if self.user == user
      true
    else
      false
    end
  end
end
