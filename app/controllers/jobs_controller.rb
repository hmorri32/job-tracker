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
    create_job(@job)
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    @job.update(job_params)
    save(@job)
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
