# frozen_string_literal: true
require 'minitest/autorun'
require_relative '../lib/calculator'

class TestCalculator < Minitest::Test
  def setup
    @calculator = Calculator.new
  end

  def test_addition
    assert_equal 5, @calculator.add(2, 3)
  end

  def test_subtraction
    assert_equal 4, @calculator.subtract(10, 6)
  end

  def test_multiply
    assert_equal 16, @calculator.multiply(4, 4)
  end

  def test_division_by_zero
    assert_raises(ZeroDivisionError) do
      @calculator.divide(10, 0)
    end
  end

  def test_division
    assert_equal 3, @calculator.divide(12, 4)
  end
end
