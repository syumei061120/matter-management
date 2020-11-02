class BusinessTalkRecord < ApplicationRecord
  has_many_attached :files
  belongs_to :user
  belongs_to :matter

  with_options presence: true do
    validates :start
    validates :end
    validates :explain
  end
end
