class Calculator
  def add(*args)
    input, check = check_and_get_args(args)
    return input unless check

    input.map { |arr| arr.flatten.map(&:to_i).sum }
  end

  def check_and_get_args(args)
    input = []
    args.each do |arg|
      ip = []
      data = arg.split(',').map(&:strip)
      data.each do |d|
        return 'Something is wrong into the input..', false  if d.empty?
        res = d.match?(/\n/) ? d.split("\n") : d
        return 'Some values found negative', false unless check_negative_value(res)
        ip << res
      end
      input << ip
    end

    return input, true
  end

  def check_negative_value(val)
    if val.class == Array
      val.each {|v| return false if v.to_i < 0}
    else
      return val.to_i > 0
    end
  end
end
