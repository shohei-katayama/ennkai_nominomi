class Public::ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
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
    @reservation = Reservation.new
    @reservation.customer_id = current_customer.id
    @reservation.save
    
    redirect_to thanks_reservations_path
  end
  
#ストロングパラメータ  
private
  
  def reservation_params
    params.require(:reservation).permit(:name,:time,:date,:address,:telephone_number,:email)
  end
  
end
