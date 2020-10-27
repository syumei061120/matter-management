class Matter < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :sales_staff, optional: true
  has_many   :clients, through: :matter_clients
  has_many   :matter_clients

  with_options presence: true do
    validates :matter_name
    validates :product
    validates :priority_id
    validates :reliability_id
    validates :progress_id
    validates :occasion
    validates :staff_in_charge
  end
  validates :is_edited, default:false
end