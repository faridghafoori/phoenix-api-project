defmodule PhoenixApiProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhoenixApiProject.Repo,
      # Start the Telemetry supervisor
      PhoenixApiProjectWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixApiProject.PubSub},
      # Start the Endpoint (http/https)
      PhoenixApiProjectWeb.Endpoint
      # Start a worker by calling: PhoenixApiProject.Worker.start_link(arg)
      # {PhoenixApiProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixApiProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixApiProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
