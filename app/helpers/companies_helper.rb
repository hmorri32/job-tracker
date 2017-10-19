module CompaniesHelper
  def create_company(company)
    if company.save
      flash[:success] = "#{company.name} added!"
      redirect_to company_path(company)
    else
      render :new
    end
  end

  def save(company)
    if company.save
      flash[:success] = "#{company.name} updated!"
      redirect_to company_path(company)
    else
      render :edit
    end
  end
end