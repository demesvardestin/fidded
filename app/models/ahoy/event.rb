class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods

  self.table_name = "ahoy_events"

  belongs_to :visit
  # belongs_to :partner, optional: true
  # belongs_to :customer, optional: true

  serialize :properties, JSON
end
