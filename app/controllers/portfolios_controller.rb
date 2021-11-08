class PortfoliosController < ApplicationController
    before_action :set_item, only: [:edit, :update, :show]

    def index
        @portfolio_items = Portfolio.all
    end

    def new
        @portfolio_items = Portfolio.new
    end

    def create
        @portfolio_items = Portfolio.new(portfolio_params)

        respond_to do |format|
            if @portfolio_items.save
                format.html {
                    redirect_to @portfolio_items, 
                    flash: {notice: 'portfolio criado com sucesso'}
                }  
            else
                format.html{ render :new, status: :unprocessable_entity }
            end
        end
        
    end

    def edit
        @portfolio_items = Portfolio.find(params[:id])
    end

    def update
        respond_to do |format|
            if @portfolio_items.update(portfolio_params)
                format.html {
                    redirect_to @portfolio_items,
                    flash: {notice: 'item atualizado com sucesso'}
                }
            else
                format.html { render 'edit', status: :unprocessable_entity }
            end
        end
    end

    def show

    end

    private

    def set_item
        @portfolio_items = Portfolio.find(params[:id])
    end

    def portfolio_params
        params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
    end

    
end
