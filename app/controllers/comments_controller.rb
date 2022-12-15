class CommentsController < ApplicationController
  # before_action :set_comment, only: %i[ index ]

  def index
    # @song = Song.find(params[:song_id])
    # @comments = @song.comments
    # Blog.where(title: 'タイトルD')
    @comments = Comment.published
  end

  def new
    @team = Team.find(params[:team_id])
    @song = Song.find(params[:song_id])
    # @team = @agenda.team
    @comment = @song.comments.build
  end
  
  def create
    @team = Team.find(params[:team_id])
    @song = Song.find(params[:song_id])
    @comment = @song.comments.build(params_valid)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
        # ContactMailer.contact_mail(@blog).deliver
        # redirect_to team_song_path(@song, team_id: @team), notice: "comment was successfully created." 
      else
        format.html { render :new, notice: '投稿できませんでした...' }
      end
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
    @song = Song.find(params[:song_id])
    @team = Team.find(params[:team_id])
    redirect_to team_song_path(@song, team_id: @team)
  end

  private

  # def set_comment
  #   @comment = Comment.find(params[:id])
  # end

  def params_valid
    params.require(:comment).permit(:content, :user_id, :audio, :song_id, :publiccomment )
  end
end
