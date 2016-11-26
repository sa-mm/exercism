defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """
              
  @students [:alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :joseph, :kincaid, :larry]
              
  @plant_map %{"R" => :radishes, 
               "C" => :clover,
               "V" => :violets,
               "G" => :grass}
    
  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @students) do
    row_map = plant_rows_map(info_string)
    student_num = number_of_students(row_map[1])
    current_student_list = get_students_from_list(student_num, Enum.sort(student_names))
    map_students_to_plants(row_map[1], row_map[2], current_student_list, student_names)
  end
  
  def number_of_students(string) do
    div(String.length(string), 2)
  end
  
  #returns a map of two strings, keys: 1 and 2
  def plant_rows_map(string) do
    list = string
    |> String.split("\n", trim: true)
    Map.new(list, fn x -> {Enum.find_index(list, fn item -> item == x end) + 1, x} end)
  end
  
  #returns list of students that have plants
  def get_students_from_list(num, student_list) do
    Enum.reduce((1..num), [], fn index,acc -> [Enum.at(student_list, index - 1)] ++ acc end)
    |> Enum.reverse
  end
  
  def map_students_to_plants(row1,row2,current_student_list, student_names) do
    row_list1 = student_row_to_list(row1)
    row_list2 = student_row_to_list(row2)
    temp_map = Map.new(current_student_list, fn k ->
      current_index = Enum.find_index(current_student_list, fn name -> name == k end) 
      {k, Enum.at(row_list1, current_index) ++ Enum.at(row_list2, current_index)}
    end)
    
    student_names
    |> Enum.reduce(temp_map, fn student, map -> 
      Map.update(map, student, {}, fn val -> 
        make_tuple(val) 
      end) 
    end)
  end
  
  
  #chunks a single row ABCD -> [[A,B],[C,D]]
  def student_row_to_list(row) do
    row
    |> String.split("", trim: true)
    |> Enum.chunk(2)
    
  end
  
  # take list, return tuple
  def make_tuple(list) do
    # IO.inspect list
    list
    |> Enum.reduce({}, fn letter, tuple -> Tuple.append(tuple, Map.get(@plant_map, letter)) end)
  end
end
