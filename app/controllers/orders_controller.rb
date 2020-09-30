class OrdersController < ApplicationController
    
    
    def index
        @orders = Order.all
    end

    def new
        # byebug
        @order = Order.new
        @customers = Customer.all
        @bakeries = Bakery.all
        @bakery = Bakery.find(params[:bakery])
        @items = @bakery.items
    end

    def create
        # byebug
        items_list = (params[:order][:item_id][1..:item_id.length])
        items_list.each do |item_id|
            @order = Order.new
            @order.customer_id = params[:order][:customer_id]
            @order.item_id = item_id
            @order.bakery_id = params[:order][:bakery_id]
            @order.save
        end
        redirect_to customer_path(@order.customer_id)
    end

    def destroy

    end

    private

    def order_params
        params.require(:order).permit( :customer_id, :bakery_id, :item_id => [])
    end

end
