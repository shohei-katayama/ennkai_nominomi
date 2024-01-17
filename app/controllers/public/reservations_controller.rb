class Public::ReservationsController < ApplicationController

  def index
    @reservations = current_customer.reservations.not_temporary
  end

  def show
    @reservation = Reservation.find(params[:id])
    @store = Store.find(params[:store_id])
  end

  def confirm
    @reservation = Reservation.find(params[:reservation_id])
    @store = Store.find(params[:store_id])
  end

  def thanks
    @reservation = Reservation.find(params[:reservation_id]).update(temporary_flg: false)
  end

  def new
    @reservation = Reservation.new
    @store = Store.find(params[:store_id])
  end

  def create
    @store = Store.find(params[:store_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id
    @reservation.store_id = @store.id

    if @reservation.save
      redirect_to confirm_store_reservations_path(@store, reservation_id: @reservation)
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
