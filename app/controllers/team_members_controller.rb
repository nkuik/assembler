class TeamMembersController < ApplicationController
  before_action :set_member, only: [:show]

  def new
    @member = TeamMember.new
    @characteristics = Characteristic.new
  end

  def create
    @member = TeamMember.new(member_params)
    if @member.save
      redirect_to team_member_path(@member)
    else
      render :new
    end
  end

  private

  def set_member
    @member = TeamMember.includes(:member_skill).find(params[:id])
  end

  def member_params
    params.require(:team_member).permit(:name,
                                        :position,
                                        :photo,
                                        :photo_cache,
                                        member_skill: [ :skills => [],
                                                        :skill_categories => [],
                                                        :techs => [],
                                                        :tech_categories => [],
                                                        :characteristics => []
                                                      ]
                                       )
  end
end
