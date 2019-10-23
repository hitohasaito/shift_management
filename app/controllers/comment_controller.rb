class CommentController < ApplicationController
  def created
    @shift = Shift.find(params[:id])
    @comment = @shift.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html{ redirect_to shift_path(@shift)}
      else
        format.html{ redirect_to shift_path(@shift)}, notice: "投稿に失敗しました"
      end
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :shift_id)
  end
end
