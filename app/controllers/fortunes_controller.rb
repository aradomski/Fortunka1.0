class FortunesController < ApplicationController
  #def index
   # @fortunes = Fortune.all
  #end
def index   
  @fortunes = Fortune.order(:author).page(params[:page]).per(3)
#    respond_with(@fortunes) 
end  

  def show
    @fortune = Fortune.find(params[:id])
  end

  def new
    @fortune = Fortune.new
  end

  def create
  @fortune = Fortune.new(params[:fortune])
  @fortune.save
  respond_with(@fortune)
end
def update
  @fortune = Fortune.find(params[:id])
  @fortune.update_attributes(params[:fortune])
  respond_with(@fortune)
end

  def edit
    @fortune = Fortune.find(params[:id])
  end


  def destroy
    @fortune = Fortune.find(params[:id])
    @fortune.destroy
    redirect_to fortunes_url, :notice => "Successfully destroyed fortune."
  end
  #def index #SEARCH
  #@fortunes = Fortune.search(params[:search]).order(:author).page(params[:page]).per(3)
 # respond_with(@fortunes)
 # end
end
