defmodule ExPaypal do
  use Application

  alias ExPaypal.API.Auth

  @spec start(any(), any()) :: {:error, any()} | {:ok, pid()}
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(Auth, [])
    ]

    opts = [strategy: :one_for_one, name: ExPaypal.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
