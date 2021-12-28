defmodule WordsToNumber do
  @moduledoc """
  It dynamically creates functions from one()
  to ninety_nine() to get numbers from "words".
  """

  @digs [
    {1, "one"},
    {2, "two"},
    {3, "three"},
    {4, "four"},
    {5, "five"},
    {6, "six"},
    {7, "seven"},
    {8, "eight"},
    {9, "nine"}
  ]

  @digs_btw_ten_and_twenty [
    {10, "ten"},
    {11, "eleven"},
    {12, "twelve"},
    {13, "thirteen"},
    {14, "fourteen"},
    {15, "fifteen"},
    {16, "sixteen"},
    {17, "seventeen"},
    {18, "eighteen"},
    {19, "nineteen"}
  ]

  @decs [
    {20, "twenty"},
    {30, "thirty"},
    {40, "forty"},
    {50, "fifty"},
    {60, "sixty"},
    {70, "seventy"},
    {80, "eighty"},
    {90, "ninety"}
  ]

  @doc """
  ## Examples

    iex> WordsToNumber.one()
    1

    iex> WordsToNumber.twenty_one()
    21

    iex> WordsToNumber.fifty_three()
    53

    iex> WordsToNumber.seventy_seven()
    77
  """

  (@digs ++
     @digs_btw_ten_and_twenty ++
     @decs ++
     for(
       {dec, dec_literal} <- @decs,
       {dig, dig_literal} <- @digs,
       do: {dec + dig, "#{dec_literal}_#{dig_literal}"}
     ))
  |> Enum.each(fn {value, literal} ->
    def unquote(:"#{literal}")(), do: unquote(value)
  end)
end
