class JobsController < ApplicationController
  include JobsHelper
  before_action :set_job,     only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:index, :new, :create, :edit]

  def index
    delegate(params)
  end

  def new
    @job = Job.new
  end

  def create
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
