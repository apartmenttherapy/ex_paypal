defmodule ExPaypal.Data.EventDateTest do
  use ExUnit.Case

  alias ExPaypal.Data.EventDate
  doctest EventDate

  defp time do
    DateTime.from_unix!(1535659478)
  end
end
