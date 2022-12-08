class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params_valid)
    if @comment.save
      # ContactMailer.contact_mail(@blog).deliver
      redirect_to comments_path, notice: "comment was successfully created." 
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
  def params_valid
    params.require(:comment).permit(:content, :user_id, :audio)
  end
end
