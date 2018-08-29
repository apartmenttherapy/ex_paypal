defmodule ExPaypal.API.Auth do
  @moduledoc """
  The Auth module handles the fetching and updating of your Access Token for the PayPal API
  """

  use GenServer

  alias ExPaypal.API.Token

  @via Application.get_env(:ex_paypal, :http_transport) || HTTPoison

  @spec start_link() :: :ignore | {:error, any()} | {:ok, pid()}
  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @spec init(:ok) :: {:ok, ExPaypal.API.Token.t()}
  def init(:ok) do
    {:ok, fetch_token()}
  end

  @spec token() :: Token.t
  def token do
    GenServer.call(__MODULE__, :get)
  end

  def handle_call(:get, _sender, token) do
    {:reply, token, token}
  end

  def handle_info(:refresh, _token) do
    {:noreply, fetch_token()}
  end

  defp fetch_token do
    Token.new(@via)
    |> schedule_refresh()
  end

  defp schedule_refresh(token) do
    interval = Token.expires_in(token, :millisecond) - 60000
    Process.send_after(__MODULE__, :refresh, interval)

    token
  end
end
