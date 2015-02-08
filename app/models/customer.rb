class Customer < ActiveRecord::Base
  validates :customer_id, uniqueness: { case_sensitive: false }
end
