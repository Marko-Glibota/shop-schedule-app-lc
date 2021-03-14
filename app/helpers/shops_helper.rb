module ShopsHelper
  def format_weekday_fr(int)
    if int == 0
      "Dimanche"
    elsif int == 1
      "Lundi"
    elsif int == 2
      "Mardi"
    elsif int == 3
      "Mercredi"
    elsif int == 4
      "Jeudi"
    elsif int == 5
      "Vendredi"
    else
      "Samedi"
    end
  end
end
