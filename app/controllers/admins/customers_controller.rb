class Admins::CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end
    
    def destroy
        @customers = Customer.all
        redirect_to  admin_customers_path
    end
end
