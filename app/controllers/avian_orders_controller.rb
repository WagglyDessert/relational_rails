class AvianOrdersController < ApplicationController
  def index
   @avianorders = AvianOrder.all.order(created_at: :desc)
  end

  def show
    @avianorder = AvianOrder.find(params[:id])
    # @avianorder.birds.count
  end
end