module Datestamper
  def self.datestamp
    Time.now.strftime('%d/%m/%Y')
  end
end
