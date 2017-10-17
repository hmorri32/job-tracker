class ContactsController < ApplicationController
  before_action :set_company, :only => [:new, :create]

  def create
    @jobs    = @company.jobs
    @contact = Contact.new(contact_params)
    @contact.company_id = @company.id
    if @contact.save
      flash[:success] = "#{@contact.name} added!"
      redirect_to company_path(@contact.company)
    else
      redirect_to company_path(@contact.company)
    end
  end

  def index
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end