require 'test_helper'

class ImpressionTest < ActiveSupport::TestCase
  test "hit counting" do
    5.times { Impression.hit }
    assert Impression.total == 5
  end

  test "time tracking" do
    Impression.hit
    sleep 1
    Impression.hit

    assert Impression.first.time < Impression.second.time
  end

end
