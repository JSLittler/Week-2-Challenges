class Calculator
  
  def initialize
    @display_calc = Display_Calc.new
  end
  
  def add(number_1, number_2)
    display_result(number_1 + number_2)
  end

  def subtract(number_1, number_2)
    display_result(number_1 - number_2)
  end

  def display_result(answer)
    @display_calc.print_answer(answer)
  end
end

class Display_Calc
  def print_answer(answer)
    "The Answer is: #{ answer }"
  end
end