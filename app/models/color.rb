class Color
  def self.request(keyword)
    uri = URI.parse(URI.encode("http://synthsky.com/iroiro/q?format=json&req=#{keyword}"))
    elements = JSON.parser.new(Net::HTTP.get(uri)).parse.fetch("scheme", {}).fetch("elements", [])
    if elements.present?
      block = lambda{|key| elements.inject(0){|sum, n| sum + n[key].to_i } / elements.length }
      { r:block.call("r"), g:block.call("g"), b:block.call("b") }
    end
  end
end
