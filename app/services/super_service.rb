class SuperService
  def self.get_supers
    response = conn.get('/superhero-api/api//all.json')
    parse(response)
  end
  
  def self.conn
    Faraday.new(url: 'https://akabab.github.io')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end 
end