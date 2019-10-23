class CommentsController < ApplicationController
  def create
    @shift = Shift.find(params[:shift_id])
    @comment = @shift.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html{ redirect_to shift_path(@shift)}
        format.js { render :index}
      else
        format.html{ redirect_to shift_path(@shift), notice: "投稿に失敗しました"}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :shift_id)
  end
end
