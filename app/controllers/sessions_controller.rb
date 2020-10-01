class SessionsController < ApplicationController
    def sign_in
        @customer = Customer.new
    end

    def create
        # check customer password input vs customer password in db 
        # .authenticate
        # find customerr
        # check if there is a customer&& if their password matches
        # THEN store id in session
        # byebug
        @customer = Customer.find_by(email: params[:customer][:email])
        # byebug
        if @customer && @customer.authenticate(params[:customer][:password])
            session[:id] = @customer.id
            session[:name] = @customer.full_name
            redirect_to bakeries_path
        else
            flash[:error] = "Incorrect Email or Password"
            redirect_to '/sign_in'
        end

    end

    def destroy
        session.clear
        redirect_to '/sign_in'
    end

    private 

    def customer_params
        params.require(:customer).permit(:email, :password)
    end
end