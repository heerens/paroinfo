class StrikesController < ApplicationController
  
  def show
    @strike = Strike.find(params[:id])
  end
  
  def new
  end
end
