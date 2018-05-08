class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.all
  end

# the name of the def is the name of the view file angular.html.erb that passes the instance variable
  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times {@portfolio_item.technologies.build}
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio_item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    # whatever portfolio item id is it will find it
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    # this will perform the lookup for the record
    @portfolio_item = Portfolio.find(params[:id])
    # this will destroy the record
    @portfolio_item.destroy
    # This will redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Your post is now obliterated.' }
    end
  end

  private
  # this params refactor follows our keeping code DRY
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end

end
