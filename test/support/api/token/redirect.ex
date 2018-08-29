defmodule ExPaypal.API.Token.Redirect do
  @moduledoc false

  def post(_url, _body, _headers, _opts) do
    {:ok, %{status_code: 302, body: "That thing moved"}}
  end
end
