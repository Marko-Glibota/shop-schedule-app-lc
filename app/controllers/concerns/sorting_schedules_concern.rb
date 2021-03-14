module SortingSchedulesConcern
  def sorted_schedules(schedule)
    sorted_schedules = [schedule]
    today_index = @schedules.index(schedule)
    count = 6
    while count > 0
      sorted_schedules << @schedules[today_index - count]
      count -= 1
    end
    sorted_schedules
  end
end
