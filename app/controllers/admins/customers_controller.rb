class Admins::CustomersController < ApplicationController
     before_action :authenticate_admin!
    def index
        @customers = Customer.all
    end
    
    def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy
        redirect_to  admins_customers_path
    end
end
