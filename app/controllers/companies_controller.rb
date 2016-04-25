class CompaniesController < ApplicationController
  before_action :authenticate_user!


  def index
    @no_results = false

    if params[:query] == '' || params[:query].nil?
      @companies = Company.all
    elsif params[:query].present?
      @companies = Company.search('%' + params[:query] + '%')
    end

    if @companies.empty?
      @no_results = true
    end
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
    @review = Review.new
    @reviews = @company.reviews
  end

  def create
    company = Company.new(company_params)
    @user = current_user
    company.user = @user
    @user.contractor!
    if company.save
      redirect_to projects_path, notice: "You have successfully created a company."
    else
    @user.user!
      redirect_to new_company_path, alert: company.errors.full_messages.join(', ')
    end
  end

  private

  def company_params
    params.require(:company).permit(
    :name, :category, :address, :zipcode, :phone, :working_since, :working_hours)
  end
end
