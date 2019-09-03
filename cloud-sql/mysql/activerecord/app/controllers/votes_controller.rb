class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  def index
    @votes = Vote.all
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
