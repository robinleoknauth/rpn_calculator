class RPNCalculator

  def initialize
    @array = []
  end

  def push(number)
    @array << number
  end

  def plus
    check_error

    result = @array.pop + @array.pop

    @array << result
  end

  def minus
    check_error

    first_number = @array.pop
    second_number = @array.pop
    result = second_number - first_number

    @array << result
  end

  def times
    check_error
    first_number = @array.pop
    second_number = @array.pop
    result = second_number * first_number

    @array << result
  end

  def divide
    check_error
    first_number = @array.pop
    second_number = @array.pop
    result = second_number / first_number.to_f

    @array << result
  end

  def value
    @array.last
  end

  def check_error
    raise "calculator is empty" if @array.empty?
  end

  def tokens(str)
    numbers = ('1'..'9').to_a
    operators = ['+', '-', '*', '/']
    str.split(" ").map do |el|
      if numbers.include?(el)
        el.to_i
      elsif operators.include?(el)
        el.to_sym
      end
    end
  end

  def evaluate(string)
    operations = tokens(string)
    operations.each do |operation|
      if operation == :+
        self.plus
      elsif operation == :-
        self.minus
      elsif operation == :/
        self.divide
      elsif operation == :*
        self.times
      else
        self.push(operation)
      end
    end
    self.value

  end

end
