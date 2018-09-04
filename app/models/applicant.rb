class Applicant < ApplicationRecord
  validates :name, :last_name, :email, :address, :city, :state, :zip, :age, :education, :about, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 15, less_than: 150 }

  before_save { self.email = email.downcase }
  has_one_attached :photo

def full_name
  self.name + " " + self.last_name
end

def full_address
  self.address + " " + self.city + " " + self.zip.to_s
end
def generate_aid
  self.aid = SecureRandom.hex(3).upcase
end
end
