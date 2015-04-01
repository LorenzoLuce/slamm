require 'solr/solr'

class QueryController < ApplicationController

  RES_PER_PAG = 6

  skip_before_filter :verify_authenticity_token, :only => [:show_file, :index]

  def index
    # si potrebbero cachare tutti i risultati e restituire solo i primi N, e poi se clicca next vengono caricati
    start_time = Time.now
    puts '=========='
    puts params[:query_string].to_s
    puts '=========='
    results, @results_number = Solr.query params[:query_string] # ritorna un array di hash
    @time = (start_time-Time.now).to_s
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

  def show_file
    @html = params[:html]
    render :layout => false
  end

end