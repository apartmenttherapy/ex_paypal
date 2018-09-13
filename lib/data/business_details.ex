defmodule ExPaypal.Data.BusinessDetails do
  @moduledoc """
  Represents the [`business_details` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-business_details) in PayPal.
  """

  alias ExPaypal.Data.{Address,
                       BusinessName,
                       CountryCode,
                       CurrencyRange,
                       EmailContact,
                       EventDate,
                       PhoneDetails,
                       IdentityDocument,
                       PhoneDetails,
                       URL}

  defstruct phone_contacts: [],
            business_address: nil,
            business_type: nil,
            category: nil,
            sub_category: nil,
            merchant_category_code: nil,
            purpose_code: nil,
            names: [],
            business_description: nil,
            event_dates: [],
            website_urls: [],
            annual_sales_volume_range: nil,
            average_monthly_volume_range: nil,
            identity_documents: [],
            email_contacts: [],
            country_of_incorporation: nil
  @type t :: %__MODULE__{
               phone_contacts: [PhoneDetails.t],
               business_address: Address.t,
               business_type: business_type,
               category: String.t,
               sub_category: String.t,
               merchant_category_code: String.t,
               purpose_code: purpose_code,
               names: [BusinessName.t],
               business_description: String.t,
               event_dates: [EventDate.t],
               website_urls: [URL.t],
               annual_sales_volume_range: CurrencyRange.t,
               average_monthly_volume_range: CurrencyRange.t,
               identity_documents: [IdentityDocument.t],
               email_contacts: [EmailContact.t],
               country_of_incorporation: CountryCode.t
             }

  @type data :: [{:phone_contacts, [PhoneDetails.t, ...]},
                 {:business_address, Address.t},
                 {:business_type, business_type},
                 {:category, String.t},
                 {:sub_category, String.t},
                 {:merchant_category_code, String.t},
                 {:purpose_code, purpose_code},
                 {:names, [BusinessName.t, ...]},
                 {:business_description, String.t},
                 {:event_dates, [EventDate.t, ...]},
                 {:website_urls, [URL.t, ...]},
                 {:annual_sales_volume_range, CurrencyRange.t},
                 {:average_monthly_volume_range, CurrencyRange.t},
                 {:identity_documents, [IdentityDocument.t, ...]},
                 {:email_contacts, [EmailContact.t, ...]},
                 {:country_of_incorporation, CountryCode.t}]

  @type business_type :: :INDIVIDUAL
                         | :PROPRIETORSHIP
                         | :PARTNERSHIP
                         | :CORPORATION
                         | :NONPROFIT
                         | :GOVERNMENT
                         | :PUBLIC_COMPANY
                         | :REGISTERED_COOPERATIVE
                         | :PROPRIETORY_COMPANY
                         | :ASSOCIATION
                         | :PRIVATE_CORPORATION
                         | :LIMITED_PARTNERSHIP
                         | :LIMITED_LIABILITY_PROPRIETORS
                         | :LIMITED_LIABILITY_PARTNERSHIP
                         | :PUBLIC_CORPORATION
                         | :OTHER_CORPORATE_BODY
  @type purpose_code :: :P0104
                        | :P0301
                        | :P0801
                        | :P0802
                        | :P0803
                        | :P0805
                        | :P0806
                        | :P0902
                        | :P1004
                        | :P1005
                        | :P1006
                        | :P1007
                        | :P1008
                        | :P1009

  @doc """
  Creates a new `t:ExPaypal.Data.BusinessDetails.t/0` struct.

  ## Parameters

    - `data`: The data to use to initialize the `t:ExPaypal.Data.BusinessDetails.t/0` struct, for possible values see `t:ExPaypal.Data.BusinessDetails.data/0` for supported values.

  ## Examples

      iex> BusinessDetails.new(business_description: "The Laundry")
      %BusinessDetails{business_description: "The Laundry"}

  """
  @spec new(data) :: __MODULE__.t
  def new(data) do
    struct(__MODULE__, data)
  end

  @doc """
  Adds a `t:ExPaypal.Data.PhoneContact.t/0` to the `:phone_contacts` for the business

  ## Parameters

    - `record`: The details to add the contact to
    - `contact`: The phone contact to add

  ## Examples

      iex> BusinessDetails.add_phone_contact(details, %PhoneDetails{})
      %BusinessDetails{phone_contacts: [%PhoneDetails{}]}

  """
  @spec add_phone_contact(__MODULE__.t, PhoneDetails.t) :: __MODULE__.t
  def add_phone_contact(record, contact) do
    contacts = [contact] ++ record.phone_contacts()

    struct(record, phone_contacts: contacts)
  end

  @doc """
  Adds a `t:ExPaypal.Data.BusinessName.t/0` record to the details

  ## Parameters

    - `record`: The record which the name is being added to
    - `name`: The name to be added

  ## Examples

      iex> BusinessDetails.add_name(details, %BusinessName{type: :LEGAL, name: "The Laundry"})
      %BusinessDetails{names: [%BusinessName{type: :LEGAL, name: "The Laundry"}]}

  """
  @spec add_name(__MODULE__.t, BusinessName.t) :: __MODULE__.t
  def add_name(record, name) do
    struct(record, names: ([name] ++ record.names()))
  end

  @doc """
  Adds an `t:ExPaypal.Data.EventDate.t/0` record to the details

  ## Parameters

    - `record`: The `t:ExPaypal.Data.BusinessDetails.t/0` struct to modify
    - `event`: The `t:ExPaypal.Data.EventDate.t/0` struct to add

  ## Examples

      iex> BusinessDetails.add_event_date(details, %EventDate{})
      %BusinessDetails{event_dates: [%EventDate{}]}

  """
  @spec add_event_date(__MODULE__.t, EventDate.t) :: __MODULE__.t
  def add_event_date(record, event) do
    struct(record, event_dates: ([event] ++ record.event_dates()))
  end

  @doc """
  Adds a `t:ExPaypal.Data.URL.t/0` record to the details

  ## Parameters

    - `record`: The details record to be modified
    - `url`: The `t:ExPaypal.Data.URL.t/0` record to be added

  ## Examples

      iex> BusinessDetails.add_url(details, %URL{website_url: "http://www.example.com"})
      %BusinessDetails{website_urls: [%URL{website_url: "http://www.example.com"}]}

  """
  @spec add_url(__MODULE__.t, URL.t) :: __MODULE__.t
  def add_url(record, url) do
    struct(record, website_urls: ([url] ++ record.website_urls()))
  end

  @doc """
  Adds an `t:ExPaypal.Data.IdentityDocument.t/0` to the details

  ## Parameters

    - `record`: The `t:ExPaypal.Data.BusinessDetails.t/0` record to be updated
    - `document`: The `t:ExPaypal.Data.IdentityDocument.t/0` to add

  ## Examples

      iex> BusinessDetails.add_identity_document(details, document)
      %BusinessDetails{identity_documents: [%IdentityDocument{type: :TAX_IDENTIFICATION_NUMBER, value: "42", partial_value: true, issuer_country_code: "US"}]}

  """
  @spec add_identity_document(__MODULE__.t, IdentityDocument.t) :: __MODULE__.t
  def add_identity_document(record, document) do
    struct(record, identity_documents: ([document] ++ record.identity_documents()))
  end

  @doc """
  Adds an `t:ExPaypal.Data.EmailContact.t/0` to the details

  ## Parameters

    - `record`: The `t:ExPaypal.Data.BusinessDetails.t/0` record to be modified
    - `contact`: The `t:ExPaypal.Data.EmailContact.t/0` to be added

  ## Examples

      iex> BusinessDetails.add_email_contact(details, email_contact)
      %BusinessDetails{email_contacts: [%EmailContact{email_address: %EmailAddress{email_address: "you@example.com"}, role: :CUSTOMER_SERVICE}]}

  """
  @spec add_email_contact(__MODULE__.t, EmailContact.t) :: __MODULE__.t
  def add_email_contact(record, contact) do
    struct(record, email_contacts: ([contact] ++ record.email_contacts()))
  end

  @doc """
  Returns any errors that might exist with the given `t:ExPaypal.Data.BusinessDetails.t/0` struct.

  ## Parameters

    - `record`: The `t:ExPaypal.Data.BusinessDetails.t/0` struct to be checked

  ## Examples

      iex> BusinessDetails.errors(bad_details)
      %{annual_sales_volume_range: :negative_range}

  """
  @spec errors(__MODULE__.t) :: nil | map
  def errors(record) do
    errors =
      record
      |> Map.from_struct()
      |> Enum.reduce(%{}, &check_attribute/2)

    case Map.size(errors) do
      0 ->
        nil
      _ ->
        errors
    end
  end

  defp check_attribute({attr, {:error, reason}}, errors) do
    Map.merge(errors, %{attr => reason})
  end
  defp check_attribute({attr, :required}, errors) do
    Map.merge(errors, %{attr => :required})
  end
  defp check_attribute(_, errors), do: errors
end
