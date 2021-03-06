class OrdersController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        @orders = Order.all

        render json: @orders
    end
end
