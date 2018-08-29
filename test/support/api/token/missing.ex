defmodule ExPaypal.API.Token.Missing do
  @moduledoc false

  def post(_url, _body, _headers, _opts) do
    {:ok, %{status_code: 404, body: "<html><head><title>The Void</title></head><body>404</body></html>"}}
  end
end
