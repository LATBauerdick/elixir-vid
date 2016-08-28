defmodule VidStore.Concrete do
  import StateMachine.Behavior
  def rent(video), do: fire(state_machine, video, :rent)
  def return(video), do: fire(state_machine, video, :return)
  def lose(video), do: fire(state_machine, video, :lose)
  def find(video), do: fire(state_machine, video, :find)
  def state_machine do
    [ available: [
        rent: [ to: :rented, calls: [&VidStore.renting/1]],
        rented: [ to: :rented, calls: [&VidStore.renting/1]]
      ],
      rented: [
        return: [ to: :available, calls: [&VidStore.returning/1]],
        lose: [to: :lost, calls: [&VidStore.losing/1]]
      ],
      lost: [
        find: [to: :available, calls: [&VidStore.finding/1]]
      ]
    ]
  end
end
