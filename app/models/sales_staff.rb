class SalesStaff < ApplicationRecord
  has_many :matters

  with_options presence: true do
    validates :department
    validates :staff
  end
end
