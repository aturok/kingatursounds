define :stuff do
  play 35, amp: 10, release: 0.6
  sleep 0.2
  play 35, amp: 10, release: 0.6
  sleep 0.5
  play 35, amp: 10, release: 0.6
end

define :wows do
  synth :mod_tri, note:60
end

in_thread do
  sync :beat_go
  loop do
    stuff
    sleep 0.5
  end
end

in_thread do
  sync :pia
  loop do
    synth :piano, note:choose([50,52,52])
    sleep 0.3
  end
end


reps = 2

reps.times do
  stuff
  sleep 0.5
end

reps.times do
  with_bpm 65 do
    stuff
    sleep 0.5
  end
end

reps.times do
  with_bpm 70 do
    stuff
    sleep 0.5
  end
end

cue :beat_go
sleep 4
cue :pia


