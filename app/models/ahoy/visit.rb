class Ahoy::Visit < ApplicationRecord
  self.table_name = "ahoy_visits"

  has_many :events, class_name: "Ahoy::Event"
  # belongs_to :partner, optional: true
  # belongs_to :customer, optional: true
end
