class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.order(:created_at).page(params[:page]).per(10)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to admin_root_path, notice: '建立餐廳資料完成'
    else
      render :new, notice: '建立餐廳資料失敗'
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to admin_restaurant_path(@restaurant), notice: '修改餐廳資料完成'
    else
      render :edit, notice: '修改餐廳資料失敗'
    end
  end

  def destroy
    @restaurant.destroy

    redirect_to admin_root_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description, :image)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
