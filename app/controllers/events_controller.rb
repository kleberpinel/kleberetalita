class EventsController < ApplicationController
  
  def list
  	
  end

  def dates
  	render :layout => false
  end


  def gift
  	@categorias_cota = CategoriaCota.find(:all)

  end
end
