defmodule ExPaypal.API.Token.Timeout do
  @moduledoc false

  def post(_url, _body, _headers, _options) do
    {:error, %{reason: "Timeout"}}
  end
end
