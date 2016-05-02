class FakeRequest
  attr_accessor :url

  def self.factory
    self.new.tap do |request|
      request.url = 'http://www.example.com/'
    end
  end
end
