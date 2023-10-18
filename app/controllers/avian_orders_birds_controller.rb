class AvianOrdersBirdsController < ApplicationController
  def index
    @avianorder = AvianOrder.find(params[:avian_order_id])
    @birds = @avianorder.birds

    if params[:sort] == "alpha"
      @birds = @avianorder.sort_birds_by_name
    end

    if params[:filter].present?
      threshold = params[:filter].to_i
      @birds = @birds.where('population > ?', threshold)
    end
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