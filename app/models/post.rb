class Post < ActiveRecord::Base
	validates :texto,  :presence => true
  	validates :titulo, :presence => true,
                    :length => { :minimum => 5, :maximum => 30 }
    validates :categoria, :presence => true
                    
    has_many :comments, :dependent => :destroy
  	has_many :tags
 	belongs_to :categoria
 	belongs_to :autor

  	accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  	self.per_page = 10
end