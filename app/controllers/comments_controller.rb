# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  # POST /posts/:post_id/comments
  def create
    # Find the post to which the comment will be added.
    @post = Post.find(params[:post_id])
    # Build a new comment associated with this post using strong parameters.
    @comment = @post.comments.build(comment_params)

    # Attempt to save the comment.
    if @comment.save
      # If successful, redirect to the post's show page with a success notice.
      redirect_to @post, notice: 'Comment was successfully added.'
    else
      # If there are errors, redirect back to the post's show page with an alert.
      redirect_to @post, alert: 'Comment could not be added.'
    end
  end

  # DELETE /posts/:post_id/comments/:id
  def destroy
    # Find the parent post.
    @post = Post.find(params[:post_id])
    # Find the specific comment within that post.
    @comment = @post.comments.find(params[:id])
    # Destroy the comment.
    @comment.destroy
    # Redirect to the post's show page with a success notice.
    redirect_to @post, notice: 'Comment was successfully deleted.'
  end

  private

  # Strong parameters to prevent mass assignment vulnerabilities for comments.
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end

