require 'test_helper'

class FortuneTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Fortune.new.valid?
  end
end
