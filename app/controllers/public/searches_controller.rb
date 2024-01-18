class Public::SearchesController < ApplicationController
  
  def search
    @content = params[:content]
    @method = params[:method]
    @stores = Store.search_for(params[:content], params[:word])
  end
  
end
