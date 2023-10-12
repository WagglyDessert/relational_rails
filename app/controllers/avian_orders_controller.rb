class AvianOrdersController < ApplicationController
  def index
   @avianorders = AvianOrder.all
  end
end