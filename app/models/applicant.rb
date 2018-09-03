class Applicant < ApplicationRecord
  before_save { self.email = email.downcase }
  has_one_attached :photo

def full_name
  self.name + " " + self.last_name
end

def generate_aid
  self.aid = SecureRandom.hex(3).upcase
end
end
