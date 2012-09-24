class Pipe::Sink::Pushover
  def initialize(options={})
    @options = options
  end

  def post
    # puts "Postin!" + @options[:message]
    # puts @options[:api_tok]
    # puts @options[:user]

    require "net/https"

    url = URI.parse("https://api.pushover.net/1/messages.json")
    req = Net::HTTP::Post.new(url.path)
    req.set_form_data({
      :token => @options[:api_tok],
      :user => @options[:user],
      :message => @options[:message],
    })
    res = Net::HTTP.new(url.host, url.port)
    res.use_ssl = true
    res.verify_mode = OpenSSL::SSL::VERIFY_PEER
    res.start {|http| http.request(req) }

  end

end