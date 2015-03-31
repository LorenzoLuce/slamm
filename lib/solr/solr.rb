module Solr

  java_import Java::it.SLaMM.client.QueryFactory

  def self.query query_string
=begin
    [{microdata: 'nannoloneeee', url: '#', title: 'titleneeee1',extract: 'sono una paginuna paginonao una paginona una paginona una paginouna paginon una paginona una paginona '},
     {microdata: 'nannoloneeee', url: '#', title: 'titleneeee2',extract: 'sono una paginuna paginonao una paginona una paginona una paginouna paginon una paginona una paginona '},
     {microdata: '', url: '#', title: 'titleneeee3',extract: 'sono una paginuna paginonao una paginona una paginona una paginouna paginon una paginona una paginona '},
     {microdata: 'nannoloneeee', url: '#', title: 'titleneeee4',extract: 'sono una paginuna paginonao una paginona una paginona una paginouna paginon una paginona una paginona '},
     {microdata: '', url: '#', title: 'titleneeee5',extract: 'sono una paginuna paginonao una paginona una paginona una paginouna paginon una paginona una paginona '},
     {microdata: 'nannoloneeee', url: '#', title: 'titleneeee6',extract: 'sono una paginuna paginonao una paginona una paginona una paginouna paginon una paginona una paginona '},
     {microdata: 'nannoloneeee', url: '#', title: 'titleneeee7',extract: 'sono una paginuna paginonao una paginona una paginona una paginouna paginon una paginona una paginona '}
    ]
=end
    factory = Java::it.SLaMM.client.QueryFactory.new()
    factory.setQuery(query_string)
    list = factory.executeQueryMicrodataBoosted() # restituisce una linked list di solr document
    arr = []
    list.each{ |doc|
      arr << doc.toString()
    }
    puts arr.to_s
  end

end