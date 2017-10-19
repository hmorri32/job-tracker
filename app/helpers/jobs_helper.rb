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

  def save(job)
    if job.save
      flash[:success] ="#{job.title} updated!"
      redirect_to company_job_path(job.company, job)
    else
      render :edit
    end
  end

  def create_job(job)
    if job.save
      flash[:success] = "You created #{job.title} at #{@company.name}"
      redirect_to company_job_path(@company, job)
    else
      render :new
    end
  end
end
