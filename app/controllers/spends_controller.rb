class SpendsController < ApplicationController
  before_action :has_access?, only: [:show, :edit, :destroy]
  def index
    @spends = current_user.spends
  end

  def new
    @spend = Spend.new
  end

  def show
    @spend = Spend.find_by(id: params[:id])
  end

  def edit
    @spend = Spend.find_by(id: params[:id])
  end

  def create
    spend = Spend.new(spend_params)
    spend.user = current_user
    if spend.save
      redirect_to root_path
    else
      flash[:errors] = spend.errors.full_messages
      redirect_to new_spend_path
    end
  end

  def destroy
    spend = Spend.find_by(id: params[:id])
    spend.destroy
    redirect_to root_path, status: :see_other
  end

  def has_access?
    redirect_to root_path unless Spend.find_by(id: params[:id]).user == current_user
  end

  private
  def spend_params
    params.require(:spend).permit(:title, :description, :amount, :category)
  end

end
