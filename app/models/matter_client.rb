class MatterClient < ApplicationRecord
  belongs_to :matter
  belongs_to :client
end
