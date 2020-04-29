class ArticleService
  private
    def connection
      Faraday.new('http://localhost:5000') do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def post_request(uri, body)

    end  
end
