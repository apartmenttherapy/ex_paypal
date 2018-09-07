defmodule ExPaypal.Data.IdentityDocument do
  @moduledoc """
  The [`identity_document` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-identity_document) for PayPal
  """

  @enforce_keys [:type, :value, :partial_value, :issuer_country_code]
  defstruct [:type, :value, :partial_value, :issuer_country_code]
  @type t :: %__MODULE__{
               type: doc_type,
               value: String.t,
               partial_value: boolean,
               issuer_country_code: String.t
             }

  @type doc_type :: :SOCIAL_SECURITY_NUMBER
                    | :EMPLOYMENT_IDENTIFICATION_NUMBER
                    | :TAX_IDENTIFICATION_NUMBER
                    | :PASSPORT_NUMBER
                    | :PENSION_FUND_ID
                    | :MEDICAL_INSURANCE_ID
                    | :CNPJ
                    | :CPF
                    | :PAN

  @doc """
  Create a new `t:ExPaypal.Data.IdentityDocument.t/0` struct

  ## Parameters

    - `type`: The document type (`t:ExPaypal.Data.IdentityDocument.doc_type/0`)
    - `value`: The identifier for the document (probably the document (id) number)
    - `partial`: Indicates whether the `value` above is partial or not.
    - `issued_by`: The 2 digit country code for the issuer of the document

  ## Examples

      iex> IdentityDocument.new(:TAX_IDENTIFICATION_NUMBER, "5252525", false, "US")
      %IdentityDocument{type: :TAX_IDENTIFICATION_NUMBER, value: "5252525", partial_value: false, issuer_country_code: "US"}

  """
  @spec new(doc_type, String.t, boolean, String.t) :: __MODULE__.t
  def new(type, value, partial, issued_by) do
    struct(__MODULE__, type: type, value: value, partial_value: partial, issuer_country_code: issued_by)
  end
end
