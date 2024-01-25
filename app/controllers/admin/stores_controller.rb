class Admin::StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to admin_stores_path
    else
      @stores = Store.all
      render 'index'
    end
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to admin_store_path(@store)
    else
      render 'edit'
    end
  end
  
  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to admin_stores_path
  end

#ストロングパラメータ
private

  def store_params
    params.require(:store).permit(:name, :introduction, :image, :genre_id)
  end

end