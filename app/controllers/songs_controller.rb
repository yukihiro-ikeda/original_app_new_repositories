class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params_valid)
    @song.user_id = current_user.id
    if @song.save
      # ContactMailer.contact_mail(@blog).deliver
      redirect_to comments_path, notice: "song was successfully created." 
    else
      render :new
    end
  end

  def show
    @comments = Comment.all
    @song = Song.find(params[:id])
  end


  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id]) 
    if @song.update(params_valid)  
      redirect_to songs_path
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private
  def params_valid
    params.require(:song).permit(:title, :user_id)
  end
end
