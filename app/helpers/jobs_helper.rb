module JobsHelper

  def delegate(params)
    case
    when params[:sort] == 'interest'
      @jobs = Job.order(:level_of_interest)
      render :interest_sorted
    when params[:sort] == 'location'
      @jobs = Job.order(:city)
      render :location_sorted
    when params[:location]
      @city = params[:location]
      @jobs = Job.where(city: params[:location])
      render :city
    else
      @jobs    = @company.jobs
      @contact = Contact.new
    end
  end
end
