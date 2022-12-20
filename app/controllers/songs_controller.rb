class SongsController < ApplicationController
  # before_action :check_user, only: %i[show edit update destroy]

  def index
    @team = Team.find(params[:team_id])
    @songs = @team.songs
  end

  def new
    @team = Team.find(params[:team_id])
    @song = @team.songs.build
  end

  def create
    @team = Team.find(params[:song][:team_id])
    @song = @team.songs.build(song_params)
    if @song.save
      # ContactMailer.contact_mail(@blog).deliver
      redirect_to team_path(@team), notice: "song was successfully created." 
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:team_id])
    @song = Song.find(params[:id])
    @comments = @song.comments
    @comment = @song.comments.build
  end


  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id]) 
    if @song.update(song_params)  
      redirect_to songs_path
    else
      render :edit
    end
  end

  def destroy
    # @team = Team.find(params[:id])
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to team_path(params[:team_id])
  end

  private
  def song_params
    params.require(:song).permit(:title, :user_id, :team_id)
  end

  # def check_user
  #   # binding.pry
  #   @assign_team = Assign.where(team_id: params[:team_id])
  #   # @team = Team.find(params[:team_id])
  #   # @song = Song.find(params[:id])
  #   # binding.pry
  #   unless @assign.user_id.include?(current_user.id)
  #     redirect_to new_user_session_path, notice: 'アクセスできません'
  #   end
  # end
end
