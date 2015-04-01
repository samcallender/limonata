class BuildingsController < ApplicationController
	def index
    respond_to do |format|
      format.html
      format.json { 
        buildings = Building.all
        render :json => buildings
       }
    end
  end
end
