class Client < ApplicationRecord
  has_many :matter_clients, dependent: :destroy
  has_many :matters, through: :matter_clients

  with_options presence: true do
    validates :company
    validates :department
    validates :name
  end
end
