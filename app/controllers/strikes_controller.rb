class StrikesController < ApplicationController
  
  def show
    @strike = Strike.find_by(key: params[:id])
  end
  
  def new
    @strike = Strike.new
    Rails.logger.info "hello"
  end
  
  def create
    @strike = Strike.new(strike_params)    # Not the final implementation!
    Rails.logger.info "Strike should be valid: #{@strike.valid?}"
    
    if @strike.save
      Rails.logger.info "saved new strike" 
      flash[:success] = "New strike added!"
      redirect_to @strike
    else
      Rails.logger.info "NOT saved" 
      render 'new'
    end
  end
    
  private

    def strike_params
      params.require(:strike).permit(:city, :category, :institution, :line, :description, :reporter, :started_at, :expected_duration, :confirmation_count, :approved, :key )
    end    
     
    
    
end
