class DraftsController < ApplicationController
  # def index
  #   @deliverable = Deliverable.find(params[:deliverable_id])
  #   @drafts = @deliverable.drafts
  # end

  def new
    @deliverable = Deliverable.find(params[:deliverable_id])
    @draft = Draft.new
  end

  def show
    @deliverable = Deliverable.find(params[:deliverable_id])
    @draft = Draft.find(params[:id])
    @comments = @draft.comments
  end

  def create
    @deliverable = Deliverable.find(params[:deliverable_id])
    @draft = Draft.new(draft_params)
    @draft.deliverable = @deliverable
    @draft.user = current_user
    if @draft.save!
      redirect_to deliverable_path(@draft), notice: "Your draft has been uploaded."
    else
      render "new"
    end
  end

  private
  def draft_params
    params.require(:draft).permit(:description, :attachment)
  end
end
