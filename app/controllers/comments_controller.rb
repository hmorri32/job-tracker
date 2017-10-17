class CommentsController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
  end

  def create
    @job     = Job.find(params[:job_id])
    @comment = Comment.new(comment_params)
    @comment.job_id = @job.id
    if @comment.save
      flash[:success] = "Comment Created!"
      redirect_to company_job_path(@comment.job.company, @comment.job)
    else
      redirect_to company_job_path(@comment.job.company, @comment.job)
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
