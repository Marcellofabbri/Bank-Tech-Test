require_relative 'datestamper'

class Record
  attr_reader :date, :debit, :credit

  def initialize
    @date = Datestamper.datestamp
    @debit = 0
    @credit = 0
  end

  def log(amount)
    if amount.positive?
      @credit += amount
    elsif amount.negative?
      @debit -= amount
    end
  end
end
