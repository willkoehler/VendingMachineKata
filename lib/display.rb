class Display

  def initialize
    @contents = 'INSERT COIN'
  end

  def show_total_cash_inserted(total)
    @contents = "$%.2f" % [total]
  end

  def read
    @contents
  end
end