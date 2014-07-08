#Addition and subtraction of money value
class Money
  attr_reader :rupees, :paisa

  def initialize rupees, paisa
    @rupees = rupees
    @paisa = paisa

  end

  def <=>(amount)
    self.convert_to_paise <=> amount.convert_to_paise
  end

  def == amount

    if (self.equal? amount)
      true

    elsif (!(self.class == amount.class))
      false

    else
      @rupees == amount.rupees && @paisa == amount.paisa
      true

    end
  end


  def hash
    [@rupees, @paisa].hash * 19
  end


  def + amount
    sum_rupees = @rupees + amount.rupees
    sum_paisa = @paisa + amount.paisa
    if sum_paisa >= 100
      sum_paisa = sum_paisa - 100
      sum_rupees = sum_rupees + 1
    end

    Money.new(sum_rupees, sum_paisa)
  end

  def - amount
    total_paisa = (@rupees *
        100 +
        @paisa) -
        (amount.rupees *
            100 +
            amount.paisa)
    Money.new(total_paisa/100, total_paisa%100)
  end

  def eql amount
    self == amount
  end
  def to_s

    if @rupees > 1
      string_rupee = "Rupees"
    else
      string_rupee = "Rupee"
    end


    if @paisa > 1
      string_paisa = "Paise"
    else
      string_paisa = "Paisa"
    end

    "#{@rupees} #{string_rupee} and #{@paisa} #{string_paisa}"
  end

  def convert_to_paise
    @rupees * 100 + @paisa
  end
end