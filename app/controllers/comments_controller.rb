class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only:[:edit, :update, :destroy]
  before_action :set_shift, only:[:create, :edit, :update, :destroy]
  before_action :check_user, only:[:edit, :update, :destroy]

  def create
    @users = User.all
    @comment = @shift.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        CommentMailer.comment_mail(@comment, @users).deliver
        format.html{ redirect_to shift_path(@shift)}
        format.js { render :index}
      else
        format.html{ redirect_to shift_path(@shift), notice: "投稿に失敗しました"}
      end
    end
  end

  def edit
    render :edit
  end

  def update
      if @comment.update(comment_params)
        redirect_to shift_path(@shift)
      else
        render :edit
      end
  end

  def destroy
    if @comment.destroy
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :shift_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_shift
    @shift = Shift.find(params[:shift_id])
  end

  def check_user
    comment = Comment.find(params[:id])
    shift = Shift.find(params[:shift_id])
    redirect_to shift_path(shift.id), notice: "権限がありません" unless current_user.id == comment.user_id || current_user.admin?
  end
end
