use Mix.Config

config :ex_paypal,
  base_url: "https://api.sandbox.paypal.com/",
  client_id: "AfeFhW9EbH1pT31yY3B4fMpd_R-wmueY8zf2RAAbqIXMbQr--gmlXzY5I1whHdOL_Kkt69bWa44SQKn9",
  client_secret: System.get_env("PAYPAL_SECRET"),
  bn_code: System.get_env("PAYPAL_BN_CODE"),
  client_meta: System.get_env("PAYPAL_CLIENT_METADATA"),
  partner_id: System.get_env("PAYPAL_PARTNER_ID")

