require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  setup do
    @company = companies(:hometown_painting)
  end

  test "should update state and city before save" do
    @company.update(:zip_code => "94043")
    assert_equal "Mountain View", @company.city
    assert_equal "CA", @company.state
  end

  test "should reset state and city without zip code" do
    @company.update(:zip_code => nil)
    refute @company.city
    refute @company.state
  end
end
