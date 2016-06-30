require_relative '../../lib/ApiClient'

class QuotesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    character = params['character']
    if character
      render json: Quote.filter(character).shuffle[0]
    else
      render json: Quote.all.shuffle[0]
    end
    # quote = ApiClient.new.getQuote()
    # render json: quote
  end

  def new
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
