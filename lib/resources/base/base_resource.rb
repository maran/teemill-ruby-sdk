require 'json'
require 'uri'
require 'net/http'
require 'openssl'

class BaseResource
  def base_url
    "#{Teemill.api_base}/v#{Teemill.api_version}"
  end

  def authenticated_request_headers
    { Authorization: Teemill.api_key }
  end

  def add_authentication_headers(request)
    authenticated_request_headers.each_key do |header|
      request[header] = authenticated_request_headers[header]
    end
  end

  def send_request(request_url, data, method = 'GET')
    url = URI("#{base_url}#{request_url}")

    http = create_http(url)

    request = Net::HTTP::Post.new(url) if method == 'POST'
    request = Net::HTTP::Get.new(url) if method == 'GET'

    request['Content-Type'] = 'application/json'

    add_authentication_headers(request)

    request.body = JSON.generate(data) if method == 'POST'

    response = http.request(request)
    JSON.parse(response.read_body)
  end

  def create_http(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end

  def send_post_request(request_url, data)
    send_request(request_url, data, 'POST')
  end

  def send_get_request(request_url, data)
    send_request(request_url, data, 'GET')
  end
end