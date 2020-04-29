class ArticleService
  private
    def connection
      Faraday.new('http://localhost:5000') do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def post_request(uri, body)
      connection.post(uri) do |request|
        request.body = body
      end  
    end
end
