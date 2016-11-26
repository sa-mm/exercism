defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus
                
  @earth_orbital_period 31557600
  @planet_map %{
      mercury: 0.2408467,
      venus: 0.61519726,
      mars: 1.8808158,
      jupiter: 11.862615,
      uranus: 84.016846,
      saturn: 29.447498,
      neptune: 164.79132
    }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    # get(map, key, default \\ nil)
    # http://elixir-lang.org/docs/stable/elixir/Map.html#get/3
    # but @planet_map[planet] would make more sense, I think
    seconds / (Map.get(@planet_map, planet, 1) * @earth_orbital_period)
  end
end



