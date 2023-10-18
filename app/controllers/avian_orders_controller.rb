class AvianOrdersController < ApplicationController
  def index
   @avianorders = AvianOrder.all.order(created_at: :desc)
  end

  def new
    @avianorder = AvianOrder.create
  end

  def show
    @avianorder = AvianOrder.find(params[:id])
    # @avianorder.birds.count
  end

  def create
    @avianorder = AvianOrder.create(avian_order_params)
    redirect_to "/avianorders"
  end

  def edit
    @avianorder = AvianOrder.find(params[:id])
  end
  
  def update
    @avianorder = AvianOrder.find(params[:id])
    @avianorder.update(avian_order_params)
    redirect_to "/avianorders"
  end
  
  def destroy
    avianorder = AvianOrder.find(params[:id])
    avianorder.destroy
    redirect_to "/avianorders"
  end

  private
  def avian_order_params
    params.permit(:order, :families, :anisodactyl, :didactyl, :tridactyl, :zygodactyl)
  end
end