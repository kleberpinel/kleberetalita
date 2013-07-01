class ImporterController < ApplicationController
	def remover
		@usuarios = User.where( :origem => "importacao")
		@usuarios.each do |usuario|
			usuario.convidados.each do |convidado|
				convidado.destroy
			end
			usuario.destroy
		end
		render :json => @usuarios
	end

	def importar
		@usuarios = []
		file_path = Rails.root.to_s + "/config/importacao/controle_casamento_cerimonia.csv";

		spreadsheet = Roo::Csv.new(file_path, nil, :ignore)
		header = spreadsheet.row(1)
		qtdConvidados = 0;
		contador = 1;
		indice = 0;
		(2..spreadsheet.last_row).each do |i|
		  	row = Hash[[header, spreadsheet.row(i)].transpose]

		  	if qtdConvidados.to_i == 0
		  		usuario = User.new
		  		usuario.nome = row["Nome"]
		  		usuario.de_onde = row["De_onde"]
		  		usuario.nome_convite = row["Nome_Convite"]
		  		usuario.convidados << Convidado.new(:nome => row["Nome"])
		  		usuario.numero_telefone = row["Telefone"] == nil ? "(11) 999999999" : row["Telefone"]
		  		usuario.endereco = row["endereco"] == nil ? "Rua De Exemplo, numero 99, apto 99 blc 9, CEP: 99999-999" : row["endereco"]
		  		usuario.nivel_certeza = row["nivel_certeza"] 

		  		usuario.email = "exemplo"+indice.to_s+"@kleberetalita.com"
		  		usuario.origem = "importacao" 
		  		usuario.password = "casamentokleberetalita"
		  		usuario.disponivel_festa = false 
		  		usuario.disponivel_cerimonia = true
		  		
		  		qtdConvidados = row["qtd_por_convite_familia"] == nil ? 0 : row["qtd_por_convite_familia"].to_i
		  		
		  		@usuarios << usuario
		  	else
		  		user = @usuarios.last 
		  		user.convidados << Convidado.new(:nome => row["Nome"])
		  		contador = contador + 1
			end

			if contador == qtdConvidados.to_i
				qtdConvidados = 0
		  		contador = 1

		  		@usuarios.last.save!
		  		indice = indice + 1
		  	end


			#product = find_by_id(row["id"]) || new
			#product.attributes = row.to_hash.slice(*accessible_attributes)
			#product.save!
		end
		render :json => @usuarios
  	end
end
