module CommentsHelper
  def create_comment(comment)
    if @comment.save
      flash[:success] = "Comment Created!"
      redirect_to company_job_path(@comment.job.company, @comment.job)
    else
      redirect_to company_job_path(@comment.job.company, @comment.job)
    end
  end
end
