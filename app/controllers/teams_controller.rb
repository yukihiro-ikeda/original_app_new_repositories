class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  
  def show
    @song = Song.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.owner_id = current_user.id
    if @team.save
      # @team.invite_member(@team.owner_id)
      redirect_to comments_path, notice: "チームを作成しました"
    else
      flash.now[:error] = "チームの作成に失敗しました"
      render :new
    end
  end


  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :owner_id)
  end
end
