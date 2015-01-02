class StrikesController < ApplicationController
  
  def show
    @strike = Strike.find_by(key: params[:id])
  end
  
  def index
    @strikes = Strike.paginate(page: params[:page], per_page: 10)
  end
  
  def new
    @strike = Strike.new
    Rails.logger.info "hello"
  end
  
  def destroy
    Strike.find_by(key: params[:id]).destroy
    flash[:success] = "Strike deleted"
    redirect_to strikes_url
  end
  
  def edit
     @strike = Strike.find_by(key: params[:id])
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
    
    
  def update
    @strike = Strike.find_by(key: params[:id])
    if @strike.update_attributes(strike_params)
      flash[:success] = "Strike updated!"
       redirect_to strikes_url
    else
      render 'edit'
    end
  end
      
  private

    def strike_params
      params.require(:strike).permit(:city, :category, :institution, :line, :description, :reporter, :started_at, :expected_duration, :confirmation_count, :approved, :key )
    end    
     
    
    
end
