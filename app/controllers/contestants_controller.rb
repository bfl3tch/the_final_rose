class ContestantsController < ApplicationController
  def index
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
    @contestants = Contestant.all.where(@bachelorette.id == :bachelorette_id)
  end
end
