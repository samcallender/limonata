class BuildingsController < ApplicationController
	def index
	@buildings = Building.where.not(finished: 0)
    respond_to do |format|
      format.html
      format.json {       
        # render :json => buildings
       }
    end
  end
end
