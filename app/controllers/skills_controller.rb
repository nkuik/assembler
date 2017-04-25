class SkillsController < ApplicationController
  before_action :set_team_member, only: [:new, :create]
  before_action :set_characteristics, only: [:new, :create]

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params.merge!(team_member: @team_member))
    delete_empties
    if @skill.save
      redirect_to team_member_path(@team_member)
    else
      render 'new'
    end
  end

  private

  def set_team_member
    @team_member = TeamMember.find(params[:team_member_id])
  end

  def set_characteristics
    @characteristics = Characteristic.new
  end

  def skill_params
    params.require(:skill).permit(:years_experience,
                                  :education,
                                  :education_type,
                                  :skill_category,
                                  :skills => [],
                                  :techs => [],
                                  :tech_categories => [],
                                  :characteristics => []
                                 )
  end

  def delete_empties
    @skill.attributes.each do |name, val|
      if val.kind_of?(Array)
        val.delete_if {|value| value.empty?}
      end
    end
  end

end
