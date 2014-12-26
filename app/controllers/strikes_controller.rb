class StrikesController < ApplicationController
  
  def show
    @strike = Strike.find(params[:id])
  end
  
  def new
    @strike = Strike.new
  end
end
