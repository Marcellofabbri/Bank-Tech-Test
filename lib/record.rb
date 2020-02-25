require_relative 'datestamper'

class Record
  attr_reader :current_balance
  attr_accessor :debit, :credit, :date

  def initialize(balance)
    @date = Datestamper.datestamp
    @debit = 0
    @credit = 0
    @current_balance = balance
  end

  def log(amount)
    if amount.positive?
      @credit += amount.to_f
    elsif amount.negative?
      @debit -= amount.to_f
    end
  end

  def render
    # to render a credit or debit as empty string if 0
    @debit = '' if debit == 0
    @credit = '' if credit == 0
  end

  def stringify
    @date.to_s + ' || ' + @credit.to_s + ' || ' + @debit.to_s + ' || ' + @current_balance.to_s
  end
end
