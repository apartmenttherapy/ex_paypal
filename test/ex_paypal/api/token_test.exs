defmodule ExPaypal.API.TokenTest do
  use ExUnit.Case

  alias ExPaypal.API.Token.{Success, Timeout, Missing, Redirect, ServerError}

  alias ExPaypal.API.Token
  doctest Token

  test "new/1 returns a valid token if the request to PayPal succeeds" do
    assert %Token{value: "Access-Token"} = Token.new(Success)
  end

  test "new/1 returns an empty token if the request to PayPal timesout" do
    assert %Token{value: nil, expiration: nil} = Token.new(Timeout)
  end

  test "new/1 returns an empty token if the request to PayPal returns a 404" do
    assert %Token{value: nil, expiration: nil} = Token.new(Missing)
  end

  test "new/1 returns an empty token if the request to PayPal redirects" do
    assert %Token{value: nil, expiration: nil} = Token.new(Redirect)
  end

  test "new/1 returns an empty token if the request to PayPal returns a 500" do
    assert %Token{value: nil, expiration: nil} = Token.new(ServerError)
  end

  test "from_raw/1 builds a Token when given a string" do
    token_string = "{\"access_token\":\"string-token\",\"expires_in\":3345}"

    assert %Token{value: "string-token"} = Token.from_raw(token_string)
  end

  test "from_raw/1 builds a Token when given a map" do
    token_map = %{"access_token" => "map-token", "expires_in" => 4535}

    assert %Token{value: "map-token"} = Token.from_raw(token_map)
  end

  test "expires_in/2 returns the number of seconds in which the token expires" do
    token = Token.new(Success)
    exp1 = Token.expires_in(token, :nanosecond)
    exp2 = Token.expires_in(token, :nanosecond)

    assert exp2 < exp1
  end
end
