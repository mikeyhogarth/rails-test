class Sale < ActiveRecord::Base
  validates :code, presence: true
end
