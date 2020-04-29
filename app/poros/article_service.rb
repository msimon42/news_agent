class ArticleService
  def get_articles(url, css_tag)

  end

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

    def articles_endpoint
      '/request-articles'
    end

    def articles_endpoint_request_body(url, css_tag)
      {
        'url' => url,
        'css-tag' => css_tag
      }.to_json
    end
end
