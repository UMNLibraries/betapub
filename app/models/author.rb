class Author < ApplicationRecord
  self.primary_key = 'internet_id'

  validates :internet_id, presence: true
  validates :internet_id, uniqueness: true

  def to_param
    internet_id.parameterize
  end
end
