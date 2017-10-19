class CommentsController < ApplicationController
  include CommentsHelper

  def new
    @job = Job.find(params[:job_id])
  end

  def create
    @job     = Job.find(params[:job_id])
    @comment = Comment.new(comment_params)
    @comment.job_id = @job.id
    create_comment(@comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
