class CompaniesController < ApplicationController
  include CompaniesHelper
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    create_company(@company)
  end

  def show
    redirect_to company_jobs_path(@company)
  end

  def edit
  end

  def update
    @company.update(company_params)
    save(@company)
  end

  def destroy
    @company.destroy
    flash[:success] = "#{@company.name} was successfully deleted!"
    redirect_to companies_path
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :city)
  end
end
