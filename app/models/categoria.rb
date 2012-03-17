class Categoria < ActiveRecord::Base
	has_many :posts
end