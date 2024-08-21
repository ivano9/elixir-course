defmodule Dictionary.Runtime.Application do

    def start(_type, _args) do
        children = [
            { Dictionary.Runtime.Server, [] }
        ]

        options = [
            name: Dictionary.Runtime.Supervisor,
            strategy: :one_for_one,
            max_restarts: 2,
            max_seconds: 20
        ]
        Supervisor.start_link(children, options)
    end

end
