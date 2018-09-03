class Student < ApplicationRecord
  belongs_to :cohort
  has_one_attached :photo
  def full_name
    self.name + " " + self.last_name
  end

def generate_sid
  self.sid = SecureRandom.hex(3).upcase
end

end
