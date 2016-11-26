defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth
  
  @num_list [1,2,3,4,5,6,7]
  @day_to_num %{friday: 5, monday: 1, saturday: 6, sunday: 7, thursday: 4, tuesday: 2,
  wednesday: 3}
  @schedule_map %{first: 0, second: 1, third: 2, fourth: 3, teenth: 12}

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  
  
  def meetup(year,month,weekday,:teenth) do
      first_day = :calendar.day_of_the_week(year,month,13)
      index_of_target = utility_fun(first_day,weekday)
      {year,month,13 + index_of_target}
  end
  
  def meetup(year,month,weekday,:last) do
      day = :calendar.last_day_of_the_month(year,month) - 6
      start_day = :calendar.day_of_the_week(year,month,day)
      index_of_target = utility_fun(start_day, weekday)
      {year,month,day + index_of_target}
  end
  
  def meetup(year, month, weekday, schedule) do
      num = Map.get(@schedule_map,schedule)
      start_day = :calendar.day_of_the_week(year,month,1)
      index_of_target = utility_fun(start_day,weekday)
      {year,month,((num * 7) + 1) + index_of_target}
  end
  
  def utility_fun(begin_day,weekday) do
      rotated_list = rotater(@num_list,[],begin_day)
      target_num = Map.get(@day_to_num,weekday)
      index_of_target = Enum.find_index(rotated_list, fn(x) -> x == target_num end)
      index_of_target
  end
  
  def rotater([head|tail],acc,begin_day) when head == begin_day do
      [head] ++ tail ++ acc
  end
  
  def rotater([head | tail], acc, begin_day) do
      rotater(tail, acc ++ [head], begin_day)
  end
end
