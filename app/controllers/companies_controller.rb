class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new
    @company = Company.new
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
