class Public::ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    @store = Store.find(params[:store_id])
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @store = Store.find(params[:store_id])
  end
  
  def new
    @reservation = Reservation.new
    @store = Store.find(params[:store_id])
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id
    @store = Store.find(params[:store_id])

    if @reservation.save
      redirect_to thanks_store_reservations_path(@store)
    else
      render 'new'  
    end
  end
  
#ストロングパラメータ  
private
  
  def reservation_params
    params.require(:reservation).permit(:name,:time,:date,:address,:telephone_number,:email,:guests)
  end
  
end
