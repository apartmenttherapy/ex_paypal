defmodule ExPaypal.Response.OrderTest do
  use ExUnit.Case

  alias ExPaypal.Response.Order
  alias ExPaypal.Data.{Amount, LinkDescription, PurchaseUnit}

  doctest Order

  test "`new/1` builds any required `purchase_units`" do
    assert [%PurchaseUnit{}] = order.purchase_units()
  end

  test "`new/1` builds any required `links`" do
    assert [%LinkDescription{}, %LinkDescription{}, %LinkDescription{}] = order.links()
  end

  test "`new/1` converts the `create_time`" do
    assert %DateTime{} = order.created_at()
  end

  test "`new/1` converts the `gross_total_amount`" do
    assert %Amount{} = order.gross()
  end

  defp order do
    Order.new(payload())
  end

  def payload do
    %{
      "create_time" => "2018-09-18T16:23:01Z",
      "gross_total_amount" => %{"currency" => "USD", "value" => "42.42"},
      "id" => "07K42630JC543372V",
      "links" => [
        %{
          "href" => "https://example.com",
          "method" => "GET",
          "rel" => "self"
        },
        %{
          "href" => "https://example.com",
          "method" => "REDIRECT",
          "rel" => "approval_url"
        },
        %{
          "href" => "https://example.com",
          "method" => "POST",
          "rel" => "pay"
        }
      ],
      "purchase_units" => [
        %{
          "amount" => %{"currency" => "USD", "total" => "42.42"},
          "payee" => %{"email" => "glen@apartmenttherapy.com"},
          "reference_id" => "glen@apartmenttherapy.com",
          "status" => "NOT_PROCESSED"
        }
      ],
      "redirect_urls" => %{
        "cancel_url" => "http://marketplace.apartmenttherapy.com",
        "return_url" => "http://marketplace.apartmenttherapy.com"
      },
      "status" => "CREATED"
    }
  end

  def response do
    %Order{
      id: "42",
      links: [
        %LinkDescription{
          href: "https://example.com",
          rel: "approval_url",
          method: :GET
        },
        %LinkDescription{
          href: "https://badsite.com",
          rel: "cracker_jack_redirect",
          method: :GET
        }
      ]
    }
  end
end
