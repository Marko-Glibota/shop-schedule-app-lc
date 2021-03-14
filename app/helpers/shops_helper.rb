module ShopsHelper
  def format_weekday_fr(int)
    if int == 0
      'Dimanche'
    elsif int == 1
      'Lundi'
    elsif int == 2
      'Mardi'
    elsif int == 3
      'Mercredi'
    elsif int == 4
      'Jeudi'
    elsif int == 5
      'Vendredi'
    else
      'Samedi'
    end
  end

  def format_hour(time)
    time.strftime('%H:%M')
  end

  def format_schedule(opening, closing)
    "#{format_hour(opening)} - #{format_hour(closing)}"
  end

  def closed?(schedule)
    schedule.morning_opening_hour.nil? && schedule.morning_closing_hour.nil? && schedule.afternoon_opening_hour.nil? && schedule.afternoon_closing_hour.nil?
  end

  def open_non_stop?(schedule)
    schedule.morning_closing_hour.nil? && schedule.afternoon_opening_hour.nil?
  end
end
