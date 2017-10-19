module ContactsHelper
  def create_contact(contact)
    if contact.save
      flash[:success] = "#{contact.name} added!"
      redirect_to company_path(contact.company)
    else
      redirect_to company_path(contact.company)
    end
  end
end