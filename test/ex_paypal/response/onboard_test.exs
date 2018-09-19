defmodule ExPaypal.Response.OnboardTest do
  use ExUnit.Case

  alias ExPaypal.Data.LinkDescription
  alias ExPaypal.Response.Onboard

  doctest Onboard

  def payload do
    %{
      "links" => [
        %{
          "description" => "Read Referral Data shared by the Caller.",
          "href" => "https://example.com",
          "method" => "GET",
          "rel" => "self"
        }
      ]
    }
  end
end
