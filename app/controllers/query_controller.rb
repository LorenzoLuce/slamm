class QueryController < ApplicationController

  def index
    # si potrebbero cachare tutti i risultati e restituire solo i primi N, e poi se clicca next vengono caricati
    @query_results = Solr.query params[:query_string] # ritorna un array di coppie (array) titolo-estratto
    respond_to do |format|
      format.js
    end
  end

end