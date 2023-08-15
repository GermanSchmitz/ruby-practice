# frozen_string_literal: true

class Calculator

  def sum(num1, num2)
    num1 + num2
  end

  def substraction (num1, num2)
    num1 - num2
  end

  def multiply(num1, num2)
    num1 * num2
  end

  def division(num1, num2)
    begin
      num1 / num2
    rescue ZeroDivisionError
      puts "Can't divide by zero."
    rescue TypeError => err
      puts err.message
    end
  end
end
