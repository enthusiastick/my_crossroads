class AshriyanDate

  def initialize(date)
    raise "Date must be a Date." unless date.kind_of? Date
    @date = date
  end

  def convert
    "#{year} AR #{month} #{@date.mday}"
  end

  def month
    case @date.mon
    when 1
      "Ers"
    when 2
      "Carris"
    when 3
      "Tyir"
    when 4
      "Rennse"
    when 5
      "Fyrunn"
    when 6
      "Medrim"
    when 7
      "Arridun"
    when 8
      "Grenn"
    when 9
      "Ottur"
    when 10
      "Curnnos"
    when 11
      "Surrn"
    when 12
      "Errund"
    end
  end

  def year
    @date.year - 1950
  end

  def self.today
    new(Time.now.in_time_zone.to_date).convert
  end

end
