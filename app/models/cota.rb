class Cota < ActiveRecord::Base
	validates :nome,  :presence => true, :uniqueness => true
	validates :imagem,  :presence => true
	validates :descricao,  :presence => true
	validates :cotas,  :presence => true
	validates :valor,  :presence => true
	validates :categoria_cota_id,  :presence => true

	belongs_to :categoria_cota
end
