class Pipe::Filter::JSONContains
  def initialize(options)
    @options = options
  end

  def match?(object)
    match = object[@options[:attribute]] =~ /#{@options[:contains]}/
    match and match >= 0
  end
end