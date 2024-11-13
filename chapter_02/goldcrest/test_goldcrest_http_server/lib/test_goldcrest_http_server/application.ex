defmodule TestGoldcrestHttpServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  @port 4001

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: TestGoldcrestHttpServer.Worker.start_link(arg)
      # {TestGoldcrestHttpServer.Worker, arg}
      {GoldcrestHttpServer, [@port]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestGoldcrestHttpServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
