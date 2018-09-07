defmodule ExPaypal.Data.BusinessDetailsTest do
  use ExUnit.Case

  alias ExPaypal.Data.{
                        BusinessDetails,
                        BusinessName,
                        EmailAddress,
                        EmailContact,
                        EventDate,
                        IdentityDocument,
                        PhoneDetails,
                        URL
                      }

  doctest BusinessDetails

  defp details do
    %BusinessDetails{}
  end

  defp bad_details do
    %BusinessDetails{
      annual_sales_volume_range: {:error, :negative_range}
    }
  end

  defp document do
    %IdentityDocument{
      type: :TAX_IDENTIFICATION_NUMBER,
      value: "42",
      partial_value: true,
      issuer_country_code: "US"
    }
  end

  defp email_contact do
    %EmailContact{
      email_address: %EmailAddress{
        email_address: "you@example.com"
      },
      role: :CUSTOMER_SERVICE
    }
  end
end
