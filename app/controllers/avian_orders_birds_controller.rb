class AvianOrdersBirdsController < ApplicationController
  def index
    @avianorder = AvianOrder.find(params[:avian_order_id])
    @birds = @avianorder.birds
  end

  def new
    @avianorder = AvianOrder.find(params[:avian_order_id])
  end

  def create
    @avianorder = AvianOrder.find(params[:avian_order_id])
    @avianorder.birds.create(bird_params)
    redirect_to "/avianorders/#{@avianorder.id}/birds"
  end

  private
  def bird_params
    params.permit(:name, :migratory, :population, :sexual_dichromatism)
  end
end