class Convidado < ActiveRecord::Base
	belongs_to :user

	self.per_page = 20
end
