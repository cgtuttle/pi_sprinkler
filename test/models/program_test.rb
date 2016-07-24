require 'test_helper'

class ProgramTest < ActiveSupport::TestCase

  test "next_date should return the correct date" do
  	program = programs(:one)
  	assert_equal "2016-01-02".to_date, program.next_date("2016-01-01")
  end
  
end
