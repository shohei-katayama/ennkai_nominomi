class Admin::HomesController < ApplicationController
  
  def top
    @params = params[:id]
  end
  
end
