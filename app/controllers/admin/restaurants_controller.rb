class Admin::RestaurantsController < ApplicationController
# t.string "name"
# t.string "tel"
# t.string "address"
# t.string "opening_hours"
# t.text "description"

  before_action :authenticate_user!
  before_action :authenticate_admin
  def index
    @restaurants = Restaurant.all
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


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description)
  end
end
