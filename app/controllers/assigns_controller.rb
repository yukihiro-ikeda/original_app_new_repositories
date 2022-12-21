class AssignsController < ApplicationController
  before_action :authenticate_user!


  def create
    
    user = User.find_by(email: params[:assign][:email])
    team = Team.find(params[:team_id])
      
    if user 
      # binding.pry
      @assign = Assign.new(user_id: user.id, team_id: team.id) 
      # @assign.user_id = User.find_by(email: params[:user][:email]).id
      # @assign.group_id = params[:user][:group_id]
      # @assign.save
      if @assign.save
        redirect_to team_path(team), notice: "招待しました." 
      else
        render :show
      end
    else
      redirect_to team_path(team), notice: "存在しないemailアドレスです." 
    end
  end

  def destroy
    @assign = Assign.find(params[:id])

    @assign.destroy
    team = Team.find(params[:team_id])
    redirect_to team_path(team), notice: "メンバーを削除しました."
  end

  private

  def assign_params
    params.require(:assign).permit(:email, :team_id )
  end

  def find_user(*)
    Assign.find_by(team_id: params[:id], user_id: current_user)
  end
  
end
