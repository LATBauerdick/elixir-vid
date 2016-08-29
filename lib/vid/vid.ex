defmodule Vid do
  use Application

  def start(_type, videos) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Vid.Server, [videos])
    ]

    opts = [strategy: :one_for_one, name: Vid.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
