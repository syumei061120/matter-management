class Matter < ApplicationRecord
  belongs_to :user
  belongs_to :sales_staff
  has_many   :matter_client

  with_options presence: true do
    validates :product
    validates :priority_id
    validates :reliability_id
    validates :progress_id
    validates :occation
    validates :staff_in_charge
    validates :is_edited
  end
end
