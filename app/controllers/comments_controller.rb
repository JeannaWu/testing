class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user = current_user
		@comment.user_id = current_user.id
		@comment.post_id = @post.id

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end
	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id]).destroy
		redirect_to posts_url
	end
	def upvote
		@comment.upvote_by current_user
		redirect_to :back
	end
	def downvote
		@comment.downvote_by current_user
		redirect_to :back
	end
end
