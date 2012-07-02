require 'test/unit'
require 'gdirections'

class TestGdirections < Test::Unit::TestCase

	def test_router_raises_argument_error
		assert_raise ArgumentError do 
			Gdirections::Router.directions
		end
	end

  def test_router_returns_result
    assert_equal Gdirections::Router.directions(:origin => "111 8th Ave, New York, NY", :destination => "55 Broad St, 10004").class, Gdirections::Result
  end
end