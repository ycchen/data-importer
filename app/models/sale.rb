class Sale < ActiveRecord::Base
  validates :purchaser, :merchant, :item, :unit, :item_cost, presence: true
  
  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant

end
