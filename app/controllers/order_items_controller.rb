class OrderItemsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        @order_items = OrderItem.all

        render json: @order_items
    end

    def show
        render json: @order_item
    end

    def create
        order = Order.find_or_create_by(:user_id => params[:checkout][:user_id], :purchased => false) {|order| order.order_number = Order.last.order_number + 1}
        
        @order_item = OrderItem.new(order_item_params)
        @order_item.order_id = order.id
    
        if @order_item.save
        
        render json: @order_item.item, status: :created
        else
        render json: @order_item.errors, status: :unprocessable_entity
        end
    end

      private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @order_item = OrderItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_item_params
      params.require(:checkout).permit(:item_id)
    end

end
