class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  def index
    @tab_count = Vote.tab_count
    @space_count = Vote.space_count
    @recent_votes = Vote.last 5
  end

  def create
    @vote = Vote.new vote_params

    if @vote.save
      format.html { redirect_to @vote, notice: "Vote was successfully created." }
      format.json { render :show, status: :created, location: @vote }
    else
      format.json { render json: @vote.errors, status: :unprocessable_entity }
    end
  end

  private

  def vote_params
    params.fetch(:candidate, {})
  end
end
