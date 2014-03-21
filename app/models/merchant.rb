class Merchant < ActiveRecord::Base
	validates :name , presence: true, uniqueness: true
	validates :address , presence: true
end
