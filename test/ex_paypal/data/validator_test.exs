defmodule ExPaypal.Data.ValidatorTest do
  use ExUnit.Case

  alias ExPaypal.Data.Validator
  doctest Validator

  test "process/2 does not remove a pair with an invalid value type" do
    checked = Validator.process({:required, 88}, pair_validator())

    assert checked == pair_validator()
  end

  defp pair_validator do
    %Validator{keys: pair_keys()}
  end

  defp validator do
    %Validator{keys: keys()}
  end

  defp keys, do: MapSet.new([:required])
  defp pair_keys, do: MapSet.new([{:required, &is_binary/1}])
end
