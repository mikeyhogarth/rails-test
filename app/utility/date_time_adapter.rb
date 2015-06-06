#
# DateTimeAdapter
# 
class DateTimeAdapter
  
  FORMATTER = '%H%M %Y%m%d'

  #
  # self.convert
  #
  def self.convert(time_as_string, date_as_string)
    return DateTime.strptime("#{time_as_string} #{date_as_string}", FORMATTER)
  end

end
