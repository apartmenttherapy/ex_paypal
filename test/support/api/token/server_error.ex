defmodule ExPaypal.API.Token.ServerError do
  @moduledoc false

  def post(_url, _body, _headers, _opts) do
    {:ok, %{status_code: 500, body: "Ooops!"}}
  end
end
