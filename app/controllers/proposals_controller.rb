class ProposalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @project = Project.find(params[:project_id])
    @company =  current_user.company
    @proposal = Proposal.new(proposal_params)
    @proposal.company = @company
    @proposal.project = @project
    if @proposal.save
      redirect_to dashboard_index_path, notice: "You have successfully submitted a Propsal."
    else
      redirect_to dashboard_index_path, alert: @proposal.errors.full_messages.join(', ')
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:body)
  end
end
