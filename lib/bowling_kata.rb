class Bowling
  def initialize
    @array_of_results = []
    @total = 0
  end

  def total_score
  strike_or_spare_at_end if strike_or_spare_at_end?
  while @array_of_results.any? do  
    if strike?
      strike_or_spare(1)
    elsif spare?
      strike_or_spare(2)
    else
      sum
    end
  end
  @total
  end

  def roll(number_of_pins_hit)
    @array_of_results << number_of_pins_hit
  end

  def strike?
    @array_of_results[0] == 10
  end

  def spare?
    @array_of_results[0] + @array_of_results[1].to_i == 10
  end

  def strike_or_spare_at_end?
    return true if @array_of_results[-3] == 10
    return true if @array_of_results[-3] + @array_of_results[-2] == 10
    false
  end

  def strike_or_spare(special_condition)
    @total += @array_of_results[0] + @array_of_results[1] + @array_of_results[2]
    @array_of_results.shift(special_condition)
  end

  def strike_or_spare_at_end
    @total += @array_of_results[-3] + @array_of_results[-2] + @array_of_results[-1]
    @array_of_results.pop(3)
  end

  def sum
    @total += @array_of_results[0] + @array_of_results[1].to_i
    @array_of_results.shift(2)
  end
end