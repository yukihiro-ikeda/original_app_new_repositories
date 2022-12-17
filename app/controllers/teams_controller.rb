class TeamsController < ApplicationController

  def index
    # binding.pry
    # Assign.where(team_id: params)
    # @teams = Team.find(params[:owner_id])
    # .where(email:current_user.email)

    # @teams = current_user.assign_teams and Team.where(owner_id:current_user.id)
    @teams = current_user.assign_teams
    @myteams = Team.where(owner_id:current_user.id)
    # @teams = Team.all
  end

  
  def show
    # binding.pry
    @team = Team.find(params[:id])
    @assign = Assign.where(team_id: params[:id])
    @songs = @team.songs
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.owner_id = current_user.id
    if @team.save
      # @team.invite_member(@team.owner_id)
      redirect_to teams_path, notice: "チームを作成しました"
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
    params.require(:team).permit(:name, :owner_id, :id)
  end
end
