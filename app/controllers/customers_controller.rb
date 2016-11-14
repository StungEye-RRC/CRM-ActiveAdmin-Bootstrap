class CustomersController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count, only: [:index]
  before_action :load_customers_to_call, only: [:index]

  def index
    @customers = Customer.all
  end
  # Automatically load the app/views/customers/index.html.erb

  def remember_to_call
    id = params[:id].to_i
    session[:customers_to_call] << id unless session[:customers_to_call].include?(id)
    redirect_to root_url, notice: "Successfully added customer to the to-call list."
  end

  def mark_as_called
    id = params[:id].to_i
    session[:customers_to_call].delete(id)

    redirect_to root_url, notice: "Marked Customer As Called"
  end

  def mark_all_as_called
    session[:customers_to_call] = []
    redirect_to root_url, notice: "Removed all Customers from To-Call List"
  end

  private

  def initialize_session
    session[:visit_count] ||= 0
    session[:customers_to_call] ||= []
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end

  def load_customers_to_call
    @customers_to_call = Customer.find(session[:customers_to_call])
  end
end
