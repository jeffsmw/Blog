class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new comment_params
    @comment.post_id = @post.id
    @comments = Comment.where(post_id: @post).order(created_at: :desc)

    if @comment.save
      redirect_to post_path(@post), notice: ('Comment created.')
    else
      render '/posts/show'
    end
  end

  def destroy
  end

  private

end
