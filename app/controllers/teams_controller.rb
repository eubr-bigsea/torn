class TeamsController < ApplicationController
  load_and_authorize_resource
  before_action :set_team, only: %i[show update destroy]

  def index
    @teams = if current_user.is_admin?
               Team.all
             elsif current_user.role_of? :manager
               projects = current_user.roles.where(name: :manager).map(&:resource)
               Team.where(id: projects.map { |p| p.teams.to_a }.flatten.map(&:id))
             else
               current_user.teams
             end

    paginate @teams, TeamSerializer
  end

  def show
    render json: TeamSerializer.new(@team)
  end

  def create
    @team = Team.create!(team_params)

    monitors_ids&.each do |monitor_id|
      monitor = User.find_by(id: monitor_id)
      monitor&.add_role :monitor, @team
    end

    render json: TeamSerializer.new(@team)
  end

  def update
    @team.update!(team_params)
    @team.roles.destroy_all

    monitors_ids&.each do |monitor_id|
      monitor = User.find_by(id: monitor_id)
      monitor&.add_role :monitor, @team
    end

    render json: TeamSerializer.new(@team)
  end

  def destroy
    @team.destroy
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :description, :category, :subcategory)
  end

  def monitors_ids
    params.require(:team).permit(monitors_ids: [])[:monitors_ids]
  end
end
