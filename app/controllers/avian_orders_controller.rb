class AvianOrdersController < ApplicationController
  def index
   @avianorders = AvianOrder.all
  end

  def show
    @avianorder = AvianOrder.find(params[:id])
  end
end