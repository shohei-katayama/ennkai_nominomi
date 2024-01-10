class Public::ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
  
#ストロングパラメータ  
private
  
  def reservation_params
    params.require(:reservation).permit(:name)
  end
  
end
