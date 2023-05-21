class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    authorize @comment

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: "Comment was successfully created." }
      else
        format.html { redirect_to @comment.post, notice: "Can't create a comment" }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id).merge(user: current_user)
  end
end
