class CommentsController < ApplicationController
	
	def create
		@job = Job.find(params[:job_id])
		@comment = @job.comments.build(params[:comment])

		if success = @comment.save
			CompanyMailer.new_comment(@job, @comment).deliver
			flash.now[:notice] 	= "Comment was created with success!"
		else
			flash.now[:alert] 	= "Please fill in all fields to create a comment."
		end
		
		respond_to do |format|
			format.html { redirect_to @job }
			format.js
		end
	end
	
	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @comment.job, notice: "Comment destroyed with success."
	end

end