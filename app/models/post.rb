class Post < ActiveRecord::Base
	validates :texto,  :presence => true
  	validates :titulo, :presence => true,
                    :length => { :minimum => 5 }
                    
    has_many :comments, :dependent => :destroy
  	has_many :tags
 	has_one :categoria

  	accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end