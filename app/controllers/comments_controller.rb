class CommentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_comment, only: %i[ index ]
  before_action :set_q, only: [:index, :search]

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
    # @user = User.find(params[:user_id])
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
        format.js { render :error }
      end
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    # binding.pry
    @team = Team.find(params[:team_id])
    @song = Song.find(params[:song_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @team = Team.find(params[:team_id])
    @song = Song.find(params[:song_id])
    @comment = Comment.find(params[:id])
    # binding.pry
    if @comment.update(params_valid)  
      redirect_to team_song_path(@team, @song, @comment)
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

  def search
    @results = @q.result
  end

  private

  # def set_comment
  #   @comment = Comment.find(params[:id])
  # end

  def params_valid
    params.require(:comment).permit(:content, :user_id, :audio, :song_id, :publiccomment, :team_id, :id )
  end

  def set_q
    @q = Comment.ransack(params[:q])
  end
end
