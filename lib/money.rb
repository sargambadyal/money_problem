#Addition and subtraction of money value
class Money
  attr_reader :rupees, :paisa

  def initialize rupees, paisa
    @rupees = rupees
    @paisa = paisa

  end

  def == other_value

    if (self.equal? other_value)
      true

    elsif (!(self.class == other_value.class))
      false

    else
      @rupees == other_value.rupees && @paisa == other_value.paisa
      true

    end
  end


  def hash
    [@rupees, @paisa].hash * 19
  end


  def + second_value
    sum_rupees = @rupees + second_value.rupees
    sum_paisa = @paisa + second_value.paisa
    if sum_paisa >= 100
      sum_paisa = sum_paisa - 100
      sum_rupees = sum_rupees + 1
    end

    Money.new(sum_rupees, sum_paisa)
  end

  def - second_value
    total_paisa = (@rupees *
        100 +
        @paisa) -
        (second_value.rupees *
            100 +
            second_value.paisa)
    Money.new(total_paisa/100, total_paisa%100)
  end

end