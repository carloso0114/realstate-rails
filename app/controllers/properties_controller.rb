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

  def contact_request
      data = {
        "name": params[:name],
        "phone": params[:phone],
        "email": params[:email],
        "property_id": params[:property_id],
        "message": params[:message],
        "source": params[:source]
      }.to_json
      api_key = EASYBROKER
      response = HTTParty.post('https://api.stagingeb.com/v1/contact_requests',
        :headers => {'Content-Type' => 'application/json', 'X-Authorization' => api_key },
        :body => data
      )

      if response.code === 422 
        redirect_to request.referrer, alert: 'Debes especificar al menos un campo de nombre, email, numero de telefono.'
      elsif response.code === 404
        redirect_to request.referrer, alert: 'La propiedad especificada no pudo ser encontrada'
      elsif response.code === 401
        redirect_to request.referrer, alert: 'Api key invalida.'
      elsif response.code === 200
        redirect_to root_path, notice: 'Mensaje enviado exitosamente, seras contactado por uno de nuestros asesores en menos de 3 dias hábiles.'
      else 
        redirect_to request.referrer, alert: response.body + " " + response.code.to_s + " " + response.message
      end

      
  end

end
