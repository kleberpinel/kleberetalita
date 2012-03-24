# -*- coding: utf-8 -*-


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

usuarioKleber = User.create(nome: "Kleber Pinel Bernardo da Silva", email: "kleberpinel@gmail.com", password: "mudar123")
usuarioTalita = User.create(nome: "Talita Lourenço Sack", email: "talita_sack@hotmail.com", password: "mudar123")

autorKleber = Autor.create(nome: "Kleber Pinel Bernardo da Silva", titulo_blog: "Blog do Kleber")
autorTalita = Autor.create(nome: "Talita Lourenço Sack", titulo_blog: "Blog da Talita")

categoria = Categoria.create!(nome: "Canadá", descricao: "Canadá")