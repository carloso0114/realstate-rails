class PropertiesController < ApplicationController

  EasyBroker.configure do |config|
    config.api_key = 'l7u502p8v46ba3ppgvj5y2aad50lb9'
  
    # Optionally change the root API URL
    config.api_root_url = EasyBroker::STAGING_API_ROOT_URL
  end
 
  def index
  @id = params[:id]
  client = EasyBroker.client
  results = client.properties.search(search: { statuses: [:published] }, limit: 15, page: @id)

  @propertiesArray = []
  results.each do |property|
    @propertiesArray.push(property)
  end

  end

  def show
    @id = params[:id]
    client = EasyBroker.client.properties.find(@id)
    @property = client
  end
end
