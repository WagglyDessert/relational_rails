class AvianOrdersBirdsController < ApplicationController
  def index
    @avianorder = AvianOrder.find(params[:avian_order_id])
    @birds = @avianorder.birds
  end
end