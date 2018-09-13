defmodule ExPaypal.Data.MetadataTest do
  use ExUnit.Case

  alias ExPaypal.Data.{Metadata, NameValuePair}
  doctest Metadata

  defp pairs do
    [
      %NameValuePair{name: "key", value: "value"}
    ]
  end
end
