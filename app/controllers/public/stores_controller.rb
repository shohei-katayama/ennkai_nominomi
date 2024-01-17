class Public::StoresController < ApplicationController
  def new
  end

  def index
    @stores = Store.all.sort {|a,b|
    b.favorites.where(created_at: from...to).size <=>
    a.favorites.where(created_at: from...to).size
    }
  end

  def show
    @store = Store.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @store = Store.find(params[:id])
  end
  
  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to admin_stores_path, notice: "情報を追加しました。"
    else
      @stores = Store.all
      render 'index'
    end
  end
  
  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to admin_stores_path, notice: "情報を更新しました。"
    else
      render 'edit'
    end
  end

#ストロングパラメータ
private

  def store_params
    params.require(:store).permit(:name, :introduction, :image, :genre_id)
  end

end