module Solr

  def self.query query_string
    query_string = 'q='+query_string+'&qt=spellCheckCompRH&defType=dismax&qf=microdata%5E30+title%5E10&hl=true&hl.snippet=1&hl.field=html&wt=ruby'
    h = Net::HTTP.new('localhost',8983)
    response = h.get('/solr/SLaMM/select?'+query_string)
    rsp = eval(response.body)
    #[[{'url'=>']','title'=>'rgrg','html'=>'rgtrgtgtg','microdata'=>'micro'},{'url'=>']','title'=>'rgrg','html'=>'rgtrgtgtg','microdata'=>'micro'}],98]
    [rsp['response']['docs'], rsp['response']['numFound']]
  end

end