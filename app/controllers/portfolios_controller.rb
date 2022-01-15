class PortfoliosController < ApplicationController
  before_action :set_item, only: %i[edit update show destroy]
  access all: %i[show index angular], user: { except: %i[destroy new create update edit] }, site_admin: :all,
         message: 'You shall not pass'
  layout 'portfolio'

  def index
    @portfolio_item = Portfolio.by_position
    @page_title = 'My Portfolio'
  end

  def sort
    params[:order].each do |_key, value|
      Portfolio.find(value['id'].to_i).update(position: value['position'].to_i)
    end
    head :no_content
  end

  def angular
    @portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_items = Portfolio.new
  end

  def create
    @portfolio_items = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_items.save
        format.html do
          redirect_to @portfolio_items,
                      flash: { notice: 'Portfolio has created' }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @portfolio_items.update(portfolio_params)
        format.html do
          redirect_to @portfolio_items,
                      flash: { notice: 'Item updated' }
        end
      else
        format.html { render 'edit', status: :unprocessable_entity }
      end
    end
  end

  def show
    @page_title = @portfolio_items.title
  end

  def destroy
    @portfolio_items.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_index_path, notice: 'Item was removed.' }
      format.js { head :no_content }
    end
  end

  private

  def set_item
    @portfolio_items = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      :main_image,
                                      :thumb_image,
                                      technologies_attributes: %i[id name destroy])
  end
end
