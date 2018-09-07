defmodule ExPaypal.Data.EventDate do
  @moduledoc """
  The [`date_of_event` object](https://developer.paypal.com/docs/api/partner-referrals/v1/#definition-date_of_event) in PayPal
  """

  defstruct [:event_type, :event_date]
  @type t :: %__MODULE__{event_type: event_type, event_date: DateTime.t}
  @type event_type :: :BIRTH
                      | :ESTABLISHED
                      | :INCORPORATION
                      | :OPERATION

  @doc """
  Creates an `t:EventDate.t/0` record.

  ## Parameters

    - `type`: The event type (`t:ExPaypal.Data.EventDate.event_type/0`)
    - `date`: The date on which the event occurred

  ## Examples

      iex> EventDate.new(:BIRTH, time)
      %EventDate{event_type: :BIRTH, event_date: time}

  """
  @spec new(event_type, DateTime.t) :: __MODULE__.t
  def new(type, date) do
    struct(__MODULE__, event_type: type, event_date: date)
  end
end
