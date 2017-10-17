class ContactsController < ApplicationController

  def new
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.find(params[:id])
    @jobs    = @company.jobs
    @contact = Contact.new(contact_params)
    @contact.company_id = @company.id
    if @contact.save
      flash[:success] = "#{contact.name} added!"
      redirect_to company_path(@contact.company)
    else
      redirect_to company_path(@contact.company)
    end
  end

  def index
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end