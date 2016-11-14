class CustomersController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count, only: [:index]

  def index
    @customers = Customer.all
  end
  # Automatically load the app/views/customers/index.html.erb

  private

  def initialize_session
    session[:visit_count] ||= 0
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end
end
