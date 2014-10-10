class Color
  def self.request(*keywords)
    colors = {}
    keywords.each do |keyword|
      uri = URI.parse(URI.encode("http://synthsky.com/iroiro/q?format=json&req=#{keyword}"))
      elements = JSON.parser.new(Net::HTTP.get(uri)).parse["scheme"]["elements"]
      block = lambda{|key| elements.inject(0){|sum, n| sum + n[key].to_i } / elements.length }
      colors[keyword] = { r:block.call("r"), g:block.call("g"), b:block.call("b") }
    end
    return colors
  end
end