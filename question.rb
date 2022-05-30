class Question
  def initialize()
    @operators = %w[+ - * /]
    @operator_strings = ['plus', 'minus', 'times', 'divided by']
  end

  # generate question to ask user
  def setup_question(numbers)
    number1 = numbers.sample
    number2 = numbers.sample
    sign = @operators.sample
    operator = @operator_strings[@operators.index sign]
    
    question = {
      question: "What does #{number1} #{operator} #{number2} equal?",
      answer: calculate(number1, sign, number2)
    }
  end

  private

  def calculate(num1, sign, num2)
    left = num1.to_f
    right = num2.to_f
    operator = sign.to_sym
    left.send(operator, right).to_f
  end
end