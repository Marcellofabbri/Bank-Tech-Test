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
      @credit += amount.to_f
    elsif amount.negative?
      @debit -= amount.to_f
    end
  end
end
