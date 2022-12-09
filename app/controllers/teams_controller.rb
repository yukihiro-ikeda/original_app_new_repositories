class TeamsController < ApplicationController

  
  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    @team.owner = current_user
    if @team.save
      @team.invite_member(@team.owner)
      redirect_to team_url(@team), notice: "チームを作成しました"
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
    params.require(:team).permit(:name)
  end
end
