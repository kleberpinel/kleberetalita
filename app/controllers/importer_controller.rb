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

		@telefone_default = "(11) 999999999"
		@endereco_default = "Rua De Exemplo, numero 99, apto 99 blc 9, CEP: 99999-999"

		@usuarios = []
		file_path = Rails.root.to_s + "/config/importacao/controle_casamento_cerimonia.csv";

		spreadsheet = Roo::Csv.new(file_path, nil, :ignore)
		header = spreadsheet.row(1)
		qtdConvidados = 0;
		contador = 1;
		indice = 999;
		(2..spreadsheet.last_row).each do |i|
		  	row = Hash[[header, spreadsheet.row(i)].transpose]

		  	if qtdConvidados.to_i == 0
		  		usuario = User.new
		  		usuario.nome = row["Nome"]
		  		usuario.de_onde = row["De_onde"]
		  		usuario.nome_convite = row["Nome_Convite"]
		  		usuario.convidados << Convidado.new(:nome => row["Nome"])
		  		usuario.numero_telefone = row["Telefone"] == nil ? @telefone_default : row["Telefone"]
		  		usuario.endereco = row["endereco"] == nil ? @endereco_default : row["endereco"]
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
		  		indice = indice - 1
		  	end
		  	
		end
		render :json => @usuarios
  	end

  	def editar
  		@telefone_default = "(11) 999999999"
		@endereco_default = "Rua De Exemplo, numero 99, apto 99 blc 9, CEP: 99999-999"

		@usuarios = []
		file_path = [Rails.root.to_s + "/config/importacao/controle_casamento.csv",
						Rails.root.to_s + "/config/importacao/controle_casamento_cerimonia.csv"];

		file_path.each do |file|
			spreadsheet = Roo::Csv.new(file, nil, :ignore)
			header = spreadsheet.row(1)

			(2..spreadsheet.last_row).each do |i|
			  	row = Hash[[header, spreadsheet.row(i)].transpose]

			  	if row["Nome_Convite"] != nil
				  	@usuario = User.find(:first, :conditions => [ "nome_convite = :u", { :u => row["Nome_Convite"].strip }])

				  	if @usuario != nil
				  		if @usuario.numero_telefone.to_s == @endereco_default.to_s
						  	@usuario.numero_telefone = row["Telefone"] == nil ? @telefone_default : row["Telefone"]
						end
						if @usuario.endereco == @endereco_default
						  	@usuario.endereco = row["endereco"] == nil  ? @endereco_default : row["endereco"]
						end

					  	@usuario.save!
					  	@usuarios << @usuario
				  	end
				end
			end
		end
		
		render :json => @usuarios
  	end
end
