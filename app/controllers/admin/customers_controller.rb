class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if@customer.update(customer_params)
      redirect_to admin_customer_path, notith: "情報を更新しました。"
    else
      render 'edit'
    end
  end

#ストロングパラメータ
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :email)
  end
  
end