class FakeRequest
  attr_accessor :url

  def self.factory
    new.tap do |request|
      request.url = 'http://www.example.com/'
    end
  end
end
