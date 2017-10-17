class JobsController < ApplicationController
  before_action :set_job,     only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:index]

  def index

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
      @jobs    = @company.jobs if @company
      @contact = Contact.new
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job     = Job.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
    @company = Company.find(params[:company_id])
  end

  def update
    @job.update(job_params)
    if @job.save
      flash[:success] ="#{@job.title} updated!"
      redirect_to company_job_path(@job.company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job.delete
    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path
  end

  private

  def set_company
    @company = Company.find(params[:company_id]) if params[:company_id]
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
