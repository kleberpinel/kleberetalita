class CartController < ApplicationController
  def checkout
    # Busca o pedido associado ao usuario; esta logica deve
    # ser implementada por voce, da maneira que achar melhor
    @invoice = current_user.invoices.last

    # Instanciando o objeto para geracao do formulario
    @order = PagSeguro::Order.new(@invoice.id)

    # adicionando os produtos do pedido ao objeto do formulario
    @invoice.products.each do |product|
      # Estes sao os atributos necessarios. Por padrao, peso (:weight) eh definido para 0,
      # quantidade eh definido como 1 e frete (:shipping) eh definido como 0.
      @order.add :id => product.id, :price => product.price, :description => product.title
    end
  end
end