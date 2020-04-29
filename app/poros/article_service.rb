class ArticleService
  def get_articles(url, css_tag)
    body = articles_endpoint_request_body(url, css_tag)
    post_request(articles_endpoint, body)
  end

  private
    def connection
      Faraday.new('https://news-agent-api.herokuapp.com/') do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def post_request(uri, body)
      response = connection.post(uri) do |request|
        request.body = body
      end

      JSON.parse(response.body)
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
