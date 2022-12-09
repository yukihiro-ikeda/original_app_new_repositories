class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params_valid)
    @comment.user_id = current_user.id
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

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id]) 
    if @comment.update(params_valid)  
      redirect_to comments_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  private
  def params_valid
    params.require(:comment).permit(:content, :user_id, :audio)
  end
end
