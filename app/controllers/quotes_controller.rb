class QuotesController < ApplicationController
  def index
    render json: Quote.all.shuffle[0]
  end

  def create
    quote = Quote.new(quote_params)
    render json: quote if quote.save
  end

  private

  def quote_params
    params.require(:quote).permit(:content, :character)
  end
end
