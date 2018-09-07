use Mix.Config

config :ex_paypal,
  base_url: "https://api.sandbox.paypal.com/v1/",
  client_id: "AfeFhW9EbH1pT31yY3B4fMpd_R-wmueY8zf2RAAbqIXMbQr--gmlXzY5I1whHdOL_Kkt69bWa44SQKn9",
  client_secret: System.get_env("PAYPAL_SECRET")
