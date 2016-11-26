defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """
  @db %{}
  
  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t, integer) :: map
  def add(db, name, grade) do
    Map.update(db, grade, [name], &([name | &1]))
    

  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t]
  def grade(db, grade) do
    Map.get(db, grade, [])
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t]}]
  def sort(db) do
    Map.to_list(db)
    |> Enum.reduce([], &(sort_tuple(&1,&2)))
    |> Enum.reverse
  end
  
  defp sort_tuple({a,b}, acc) do
    [{a, Enum.sort(b)} | acc]
  end
end
