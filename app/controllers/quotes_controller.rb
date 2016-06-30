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
  end

  def new
  end

  def create
    if params[:quote]
      quote = Quote.new(quote_params)
      render json: quote if quote.save
    else
      get_quote_from_api
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:content, :character)
  end

  def get_quote_from_api
    quote_data = ApiClient.new.get_quote()
    quote = Quote.new(content: quote_data['quote'],
                      character: quote_data['character'])
    render json: quote if quote.save
  end
  # def parse_data(data)
  #   {
  #     'quote': {
  #       'content': data['quote'],
  #       'character': data['character']
  #     }
  #   }
  # end
end
