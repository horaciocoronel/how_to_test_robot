require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # skip
    # arrange
    my_robot = Robot.new
    my_robot.foreign_model = true
    my_robot.needs_repairs = true
    # act
    my_test = my_robot.station
    # assert
    assert_equal( 1, my_test )
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # skip
    my_robot = Robot.new
    my_robot.vintage_model = true
    my_robot.needs_repairs = true
    # act
    my_test = my_robot.station
    # assert
    assert_equal( 2, my_test )
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # skip
    my_robot = Robot.new
    my_robot.needs_repairs = true
    # act
    my_test = my_robot.station
    # assert
    assert_equal( 3, my_test )
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # skip
    my_robot = Robot.new
    my_robot.needs_repairs = false
    # act
    my_test = my_robot.station
    # assert
    assert_equal( 4, my_test )
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # skip
    # arrange
    my_robot = Robot.new
    # act
    my_test = my_robot.prioritize_tasks
    # assert
    assert_equal( -1, my_test)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # skip
    # arrange
    my_robot = Robot.new
    my_robot.todos = [3, 6, 1]
    # act
    my_test = my_robot.prioritize_tasks
    # assert
    assert_equal( 6, my_test)
  end

  def test_workday_on_day_off_returns_false
    # skip
    # arrange
    my_robot = Robot.new
    day_off = true
    # act
    my_test = my_robot.workday?(day_off)
    # assert
    expected = true
    assert_equal(expected, my_test)
  end

  def test_workday_not_day_off_returns_true
    # skip
    # arrange
    my_robot = Robot.new
    day_off = false
    # act
    my_test = my_robot.workday?(day_off)
    # assert
    expected = true
    assert_equal(expected, my_test)
  end

end
