class Public::SearchesController < ApplicationController
  
  def search
    @content = params[:content]
    @method = params[:method]
  end
  
end
