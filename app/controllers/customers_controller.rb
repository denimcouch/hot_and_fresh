class CustomersController < ApplicationController
    before_action :current_customer, only: [:show, :edit, :update, :destroy]

    def current_customer
        @customer = Customer.find(params[:id])
    end

    def index
        @customers = Customer.all
    end
    
    def show
    end

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(custy_params)
        if @customer.valid?
            @customer.save
            redirect_to customer_path(@customer)
        else
            flash[:errors] = @customer.errors.full_messages
            redirect_to new_customer_path
        end
    end

    def edit 
    end

    def update
        @customer.update(custy_params)
        if @customer.valid?
            redirect_to customer_path(@customer)
        else
            flash[:errors] = @customer.errors.full_messages
            redirect_to edit_customer_path(@customer)
        end
    end

    def destroy
        @customer.destroy
        redirect_to customers_path
    end

    private

    def custy_params
        params.require(:customer).permit(:first_name, :last_name)
    end
end
