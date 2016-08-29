defmodule States do
  use Application

  def start(_type, videos) do
    import Supervisor.Spec, warn: false

    children = [
      worker(States.Server, [videos])
    ]

    opts = [strategy: :one_for_one, name: States.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
