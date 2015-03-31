require 'solr/solr'

class QueryController < ApplicationController

  RES_PER_PAG = 6

  def index
    # si potrebbero cachare tutti i risultati e restituire solo i primi N, e poi se clicca next vengono caricati
    results = Solr.query params[:query_string] # ritorna un array di hash
    i=0
    @query_pages = (results.size.to_f/RES_PER_PAG.to_f).ceil()
    @query_results = []

    @query_pages.times { |time|
      array_page = []
      RES_PER_PAG.times { |time|
        res = results[i]
        break unless res
        array_page << res
        i += 1
      }
      @query_results << array_page
    }
    respond_to do |format|
      format.js { render "query/index" }
    end
  end

end