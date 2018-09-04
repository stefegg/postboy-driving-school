class Student < ApplicationRecord
  validates :name, :last_name, :age, :education, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 15, less_than: 150 }
  belongs_to :cohort
  has_one_attached :photo
  def full_name
    self.name + " " + self.last_name
  end

def generate_sid
  self.sid = SecureRandom.hex(3).upcase
end

end
