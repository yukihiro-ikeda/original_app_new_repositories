class CommentsController < ApplicationController
  # before_action :set_comment, only: %i[ index ]

  def index
    # @song = Song.find(params[:song_id])
    # @comments = @song.comments
    # Blog.where(title: 'タイトルD')
  end

  def new
    @song = Song.find(params[:song_id])
    # @team = @agenda.team
    @comment = @song.comments.build
  end

  def create
    @song = Song.find(params[:song_id])
    @comment = @song.comments.build(params_valid)
    @comment.user_id = current_user.id
    if @comment.save
      # ContactMailer.contact_mail(@blog).deliver
      render :new, notice: "comment was successfully created." 
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

  # def set_comment
  #   @comment = Comment.find(params[:id])
  # end

  def params_valid
    params.require(:comment).permit(:content, :user_id, :audio, :song_id )
  end
end
