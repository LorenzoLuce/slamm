require 'solr/solr'

class QueryController < ApplicationController

  def index
    # si potrebbero cachare tutti i risultati e restituire solo i primi N, e poi se clicca next vengono caricati
    @query_results = Solr.query params[:query_string] # ritorna un array di hash
    respond_to do |format|
      format.js { render "query/index" }
    end
  end

end