class Vendor < ActiveRecord::Base
  validates :vendor_id, uniqueness: { case_sensitive: false }
end
