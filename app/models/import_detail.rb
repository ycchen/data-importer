class ImportDetail < ActiveRecord::Base
  belongs_to :import
  validates :purchaser_name , presence: true
  validates :merchant_name, presence: true
  validates :merchant_address, presence: true
  validates :item_description, presence: true
  validates :item_price, presence: true, numericality: true
  validates :purchase_count, presence: true, numericality: true
  validates :import_id, presence: true
end
