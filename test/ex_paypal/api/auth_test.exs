defmodule ExPaypal.API.AuthTest do
  use ExUnit.Case

  alias ExPaypal.API.{Auth, Token}
  doctest Auth

  test "token/0 returns the current auth token" do
    assert %Token{} = Auth.token()
  end

  test "refreshing acquires a new token" do
    token1 = Auth.token()
    Process.sleep(1000)
    Process.send(Auth, :refresh, [])
    token2 = Auth.token()

    refute token1 == token2
  end

  test "tokens are automatically refreshed 60 seconds before they expire" do
    token1 = Auth.token()
    Process.sleep(Token.expires_in(token1, :millisecond) - 59000)
    token2 = Auth.token()

    refute token1 == token2
  end
end
