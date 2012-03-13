class Post < ActiveRecord::Base
	validates :texto,  :presence => true
  	validates :titulo, :presence => true,
                    :length => { :minimum => 5 }
                    
    has_many :comments
end
