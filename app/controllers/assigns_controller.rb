class AssignsController < ApplicationController
  
  def create
    user = User.find_by(email: params[:assign][:email])
    team = Team.find(params[:team_id])
    # binding.pry
    @assign = Assign.new(user_id: user.id, team_id: team.id)
    if @assign.save
      redirect_to team_path(team), notice: "招待しました." 
    else
      render :show
    end
  end

  def destroy
  end

  private

  def assign_params
    params.require(:assign).permit(:email, :team_id )
  end
  
end
