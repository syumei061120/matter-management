class Client < ApplicationRecord
  has_many :matter_clients

  with_options presence: true do
    validates :company
    validates :department
    validates :name
  end
end
