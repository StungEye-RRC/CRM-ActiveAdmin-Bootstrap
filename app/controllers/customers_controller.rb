class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  # Automatically load the app/views/customers/index.html.erb
end
