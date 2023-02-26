require 'net/http'

class YmereChangesController < ApplicationController

  def index
    @ymere_changes = YmereChange.all
    @ymere_change = YmereChange.new
    
    resource = Net::HTTP.new("www.ymere.nl")
    headers, data = resource.get('/ymere/index.asp?id=2246&actie=zr&huur=1&koop=1&bouwtype=0&plaats=0&kamers=0&objecttype=5&woonoppervlak=0&prijs=0&balkon=0&tuin=0&serre=0')
    
    @ymere_change.page_hash = data
    
    last = YmereChange.find(:first, :order => 'created_at DESC')
    
    if last == nil || last.page_hash != @ymere_change.page_hash 
      @ymere_change.save! 
    end
    
    render :layout => false;
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

end