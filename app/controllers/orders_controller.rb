class OrdersController < ApplicationController
    
    def index
        @orders = Order.all
    end

    def new
        # byebug
        @customers = Customer.all
        @bakery = Bakery.find(params[:bakery])
        @items = @bakery.items
    end

    def create
        # byebug
        params[:item_id].each do |item_id|
            @order = Order.new
            @order.customer_id = params[:customer_id]
            @order.item_id = item_id
            @order.save
        end
        redirect_to customer_path(params[:customer_id])
    end

    def destroy

    end
end
