class Foto < ActiveRecord::Base
	validates :nome,  :presence => true, :uniqueness => true
	validates :picture,  :presence => true

	belongs_to :album
end