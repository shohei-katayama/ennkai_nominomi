class Public::HomesController < ApplicationController
  
  def top
    @stores = Store.all
  end

  def about
  end
end
