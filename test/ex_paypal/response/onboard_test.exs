defmodule ExPaypal.Response.OnboardTest do
  use ExUnit.Case

  alias ExPaypal.Data.LinkDescription
  alias ExPaypal.Response.Onboard

  doctest Onboard

  defp onboard, do: Onboard.new(payload)

  # This payload is actually used in other tests so should remain public
  def payload do
    %{
      "links" => [
        %{
          "description" => "Read Referral Data shared by the Caller.",
          "href" => "https://example.com",
          "method" => "GET",
          "rel" => "action_url"
        }
      ]
    }
  end
end
