defmodule ExPaypal.API.Token.Success do
  @moduledoc false

  def post(_url, _body, _headers, _auth) do
    {:ok, %{body: body(), status_code: 200}}
  end

  defp body do
    """
    {
      "scope": "https://uri.paypal.com/services/subscriptions https://api.paypal.com/v1/payments/.* https://api.paypal.com/v1/vault/credit-card https://uri.paypal.com/services/applications/webhooks openid https://uri.paypal.com/payments/payouts https://api.paypal.com/v1/vault/credit-card/.*",
      "nonce": "2017-06-08T18:30:28ZCl54Q_OlDqP6-4D03sDT8wRiHjKrYlb5EH7Di0gRrds",
      "access_token": "Access-Token",
      "token_type": "Bearer",
      "app_id": "APP-80W284485P519543T",
      "expires_in": 61
    }
    """
  end
end
