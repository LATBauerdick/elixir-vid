defmodule VidTest do
  use ExUnit.Case
  import Should
  should "should update count" do
    rented_video = VidStore.renting(video)
    assert rented_video.times_rented == 1
  end
  should "rent video" do
    rented_video = VidStore.rent video
    assert :rented == rented_video.state
    assert 1 == Enum.count(rented_video.log)
  end
  should "handle multiple transitions" do
    import VidStore
    vid = video |> rent |> return |> rent |> return
          |> rent |> lose |> find |> rent
    IO.puts " "
    vid.log |> Enum.reverse |> Enum.each( &IO.inspect/1 )
    assert 8 == Enum.count(vid.log)
    assert 4 = vid.times_rented
  end

  def video, do: %Video{title: "All the President's Men"}
end
