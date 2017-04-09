require 'test_helper'

class LazyLoad::Rails::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, LazyLoad::Rails
  end
end
